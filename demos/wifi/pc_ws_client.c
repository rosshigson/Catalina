/*
 * ws_pc_client.c - a simple ws client that can be run on a PC (compile for
 *                  Linux or Cygwin using gcc) and used to communicate with 
 *                  an instance of ws_server.c running on a Propeller.
 *
 *                  We send a GET to establish a WebSocket. Thereafter, we
 *                  use TCP anf have to explicitly frame and unframe the 
 *                  WebSockets traffic (non-fragmented text frames only).
 *
 * IMPORTANT: The SERVER_IP (see below) IP address will need to be set.
 *
 * Note that this program does not close its websockets gracefully, so the 
 * server may run out of connections.
 *
 * Note that the Websockets Key (WS_KEY) and Mask (WS_MASK) used in this 
 * program are for demo purpose only - in a real application they should be 
 * randomly generated according to the WebSockets specification.
 */

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <netdb.h>

#ifdef __CATALINA__
#error This is NOT a Catalina Program - compile it with gcc on Cygwin or Linux.
#endif

#define SERVER_IP         "xxx.xxx.xxx.xxx" // IP address of Server

// ws_encode_str - encode a string into the buffer, adding the necessary 
//                 websocket frame. The string must be null terminated.
//                 This function only supports encoding up to 65535 bytes. 
//                 Returns the length of the result, which must fit into buff, 
//                 or -1 on any error.
//
// TBD - send multiple frames if data > SOME_MAX_DATA_CONSTANT
//
int ws_encode_str(uint8_t *buff, char *str, uint32_t mask) {
   int len;
   int i;
   int c;
   uint8_t m[4];

   len = strlen(str);
   c = 0;
   m[0] = mask>>24 & 0xFF;
   m[1] = mask>>16 & 0xFF;
   m[2] = mask>>8  & 0xFF;
   m[3] = mask     & 0xFF;

   if (len > 65535) {
      return -1;
   }
   else if (len > 126) {
     buff[0] = 0x81; // FIN + TXT
     buff[1] = 126;
     buff[2] = ((len>>8) & 0xFF) | 0x80; // MASK
     c = 0;
     buff[3] = len & 0xFF;
     for (i = 0; i < 4; i++) {
        buff[i+4] = m[i];
     }
     for (i = 0; i < len; i++) {
        buff[i+8] = str[i] ^ m[c];
        c = (c+1) % 4;
     }
     return len+8;
   }
   else {
     buff[0] = 0x81; // FIN + TEXT
     buff[1] = len | 0x80; // MASK
     memcpy(&buff[2], str, len);
     for (i = 0; i < 4; i++) {
        buff[i+2] = m[i];
     }
     for (i = 0; i < len; i++) {
        buff[i+6] = str[i] ^ m[c];
        c = (c+1) % 4;
     }
     return len+6;
   }
}

// decode string data - if the data is masked, then the buffer is unmasked.
//                      Returns a pointer to the null terminated string, or
//                      NULL on any error.
char *ws_decode_str(uint8_t *buff) {
   char *data = NULL;
   int len = 0;
   int masked = 0;
   int c = 0;
   int i;
   uint8_t m[4] = {0, 0, 0, 0};

   if (buff[0] != 0x81) { // FIN + TXT
      return NULL; // not a WebSockets text frame?
   }
   if ((buff[1] & 0x7F) == 127) {
      return NULL; // we don't handle frames this large
   }
   else if ((buff[1] & 0x7F) == 126) {
      len = ((buff[2] << 8) & 0x7F) + buff[3];
      if (buff[1] & 0x80) {
         masked = 1;
         for (i = 0; i < 4; i++) {
            m[i] = buff[i+4];
         }
         data = &buff[8];
      }
      else {
         data = &buff[4];
      }
   }
   else {
      len = buff[1] & 0x7F;
      if (buff[1] & 0x80) {
         masked = 1;
         for (i = 0; i < 4; i++) {
            m[i] = buff[i+2];
         }
         data = &buff[6];
      }
      else {
         data = &buff[2];
      }
   }
   data[len] = 0;
   if (masked) {
     char *mdata = data;
     for (i = 0; i < len; i++) {
        mdata[i] = data[i] ^ m[c];
        c = (c+1) % 4;
     }
   }
   return data;
}

// These are for demo purposes only ...
static uint32_t WS_MASK  = 0xDEADBEEF;
static char     WS_KEY[] = "6OmI3aQmM/GgQ6G+wM6n+A==";

int main() {
    uint8_t buff[512] = "";
    uint8_t msg[512] = "";
    int msg_count = 1;
    int len = 0;
    int server_fd = 0;
    struct sockaddr_in address;
    struct sockaddr_in client_addr;
    char client_ip[16];
    struct hostent *host_entry;
    int port = 0;

    printf("\nThis program may need Administrator or root privileges\n\n");

    // get our own IP address
    if (gethostname(buff, sizeof(buff)) < 0) {
       perror("gethostname");
       exit(-1);
    }
    if ((host_entry = gethostbyname(buff)) == NULL) {
       perror("gethostbyname");
    }

    // Create a socket to talk to the server
    server_fd = socket(AF_INET, SOCK_STREAM, 0);

    if (server_fd == -1) {
       printf("socket creation failed\n");
    }

    // Set up IP and port
    bzero(&address, sizeof(address));
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr(SERVER_IP);
    address.sin_port = htons(80); // must be 80 since the WiFi module uses this
 
    // Connect to the server.
    if (connect(server_fd, (struct sockaddr *)&address, sizeof(address)) != 0) {
        printf("Connect failed\n");
    }
    else {
        printf("Connected\n");
    }

    // Get my ip address 
    bzero(&client_addr, sizeof(client_addr));
    socklen_t slen = sizeof(client_addr);
    getsockname(server_fd, (struct sockaddr *) &client_addr, &slen);
    inet_ntop(AF_INET, &client_addr.sin_addr, client_ip, sizeof(client_ip));

    printf("Local ip address: %s\n", client_ip);

    // Put a GET request into the buffer, with our IP address.
    sprintf(buff,
            "GET /ws/xxx HTTP/1.1\r\n"
            "Host: %s \r\n"
            "Connection: keep-alive, Upgrade\r\n"
            "Upgrade: websocket\r\n"
            "Sec-WebSocket-Key: %s\r\n"
            "Sec-WebSocket-Version: 13\r\n"
            "\r\n",
            WS_KEY, 
            SERVER_IP);

    // send the GET request to get the other end to 
    // establish the WebSocket connection
    printf("Sending GET\n");
    len = send(server_fd, buff, strlen(buff), 0);
    if (len <= 0) {
        perror("send");
    }

    // Receive back a response into the buffer
    // (note - this is not a WebSocket frame!)
    bzero(buff, sizeof(buff));
    len = recv(server_fd, buff, sizeof(buff), 0);
    if (len == 0) {
        perror("No data\n");
    }
    else if (len < 0) {
        perror("recv");
    }
    else {
        int i;
        buff[len] = 0;
        printf("Read: %s\n", buff);
    }

    while (1) {
       int i;

       // Receive a message into the buffer
       bzero(buff, sizeof(buff));
       len = recv(server_fd, buff, sizeof(buff), 0);
       if (len == 0) {
           perror("No data\n");
       }
       else if (len < 0) {
           perror("recv");
           exit(EXIT_FAILURE);
       }
       else {
           char *str = ws_decode_str(buff);
           printf("Recv: %s\n", str);
           //for (i = 0; i < len; i++) {
              //printf("%02X ", buff[i]);
           //}
           //printf("\n");
       }

       // send something ...
       sprintf(msg, "Message %d sent from PC WebSockets Client", msg_count++);
       len = ws_encode_str(buff, msg, WS_MASK);
       //for (i = 0; i < len; i++) {
          //printf("%02X ", buff[i]);
       //}
       //printf("\n");

       len = send(server_fd, buff, len, 0);
       if (len == 0) {
         printf("No data sent\n");
       }
       else if (len <= 0) {
         perror("send");
       }

    }

    close(server_fd);

    printf("Client done\n");

}

