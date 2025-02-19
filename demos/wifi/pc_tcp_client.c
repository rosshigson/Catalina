/*
 * pc_client.c - a simple TCP client that can be run on a PC (compile for
 *               Linux or Cygwin using gcc) and used to communicate with 
 *               an instance of tcpserver.c running on a Propeller.
 *
 *               Since we cannot connect to the only socket the server is
 *               listening on (port 80 for http requetss) we send a POST
 *               request telling the server our IP address and port. The
 *               server will then make a TCP connection with that port
 *               and we can start exchanging messages.
 *
 * IMPORTANT: The SERVER_IP (see below) IP address will need to be set.
 */

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <netdb.h>

#ifdef __CATALINA__
#error This is NOT a Catalina Program - compile it with gcc on Cygwin or Linux.
#endif

#define SERVER_IP         "xxx.xxx.xxx.xxx" // IP address of Server

#define WELL_KNOWN_PORT  666   // port the server will connect to
                               // (port must be available on the PC)

int main() {
    char buff[512] = "";
    int len = 0;
    int client_fd = 0;
    int server_fd = 0;
    int accepted_fd = 0;
    struct sockaddr_in address;
    struct sockaddr_in client_addr;
    char client_ip[16];
    struct hostent *host_entry;
    int port = 0;
    int client_port = 0;
    int msg_num = 1;

    printf("\nThis program may need Administrator or root privileges\n\n");

    // get our own IP address
    if (gethostname(buff, sizeof(buff)) < 0) {
       perror("gethostname");
       exit(-1);
    }
    if ((host_entry = gethostbyname(buff)) == NULL) {
       perror("gethostbyname");
    }

    // Create a socket the sever can connect to
    if ((client_fd = socket(AF_INET, SOCK_STREAM, 0)) == -1) {
       perror("socket");
    }

    // Set up a local IP and port the server can connect to
    bzero(&address, sizeof(address));
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr("0.0.0.0");
    address.sin_port = htons(WELL_KNOWN_PORT);
    if (bind(client_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
      perror("bind");
    }

    // Listen for incoming connections
    if (listen(client_fd, 3) < 0) {
      perror("listen");
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

    // Get my ip address and port
    bzero(&client_addr, sizeof(client_addr));
    socklen_t slen = sizeof(client_addr);
    getsockname(server_fd, (struct sockaddr *) &client_addr, &slen);
    inet_ntop(AF_INET, &client_addr.sin_addr, client_ip, sizeof(client_ip));
    client_port = ntohs(client_addr.sin_port);

    //printf("Local ip address: %s\n", client_ip);
    //printf("Local port : %u\n", client_port);

    // Put a POST request into the buffer, with our IP address.
    sprintf(buff,
            "POST /prop HTTP/1.1\r\n"
            "Host: %s \r\n"
            "Connection: keep-alive\r\n"
            "Upgrade-Insecure-Requests: 1\r\n"
            "Accept: text/html\r\n"
            "Content-Type: text/plain\r\n"
            "Content-Length: %d\r\n"
            "\r\n"
            "%s %6d",
            SERVER_IP, strlen(client_ip)+7, client_ip, WELL_KNOWN_PORT);

    // send the POST request to get the other end to 
    // establish the TCP connection
    printf("Sending POST\n");
    len = send(server_fd, buff, strlen(buff), 0);
    if (len <= 0) {
        perror("send");
    }

    // accept a connection from the server
    printf("Waiting for connection ...");
    if ((accepted_fd = accept(client_fd, NULL, NULL)) < 0) {
      perror("accept");
    } 
    else {
       printf(" done\n");
    }

    // Receive back a message into the buffer
    // (no real need for this - it just confirms the POST got processed)
    bzero(buff, sizeof(buff));
    len = recv(accepted_fd, buff, sizeof(buff), 0);
    if (len == 0) {
        perror("No data received\n");
    }
    else if (len < 0) {
        perror("recv");
    }
    else {
        buff[len] = 0;
        printf("Rcvd: %s\n", buff);
    }

    while (1) {
       // Put a test message into the buffer.
       sprintf(buff, "Message %d from the TCP Client", msg_num++);

       // send the test message
       len = send(accepted_fd, buff, strlen(buff), 0);
       if (len == 0) {
           printf("No data sent\n");
       }
       else if (len < 0) {
           perror("send\n");
           break;
       }

       // Receive back a message into the buffer.
       bzero(buff, sizeof(buff));
       len = recv(accepted_fd, buff, sizeof(buff), 0);
       if (len == 0) {
           printf("No data received\n");
       }
       else if (len < 0) {
           perror("recv");
           break;
       }
       else {
           buff[len] = 0;
           printf("Rcvd: %s\n", buff);
       }
    }

    close(accepted_fd);

    close(client_fd);

    printf("Client done\n");

}

