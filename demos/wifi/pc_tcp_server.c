/*
 * pc_server.c - a simple TCP server that can be run on a PC (comile for
 *               Linux or Cygwin using gcc) and used to communicate with 
 *               an instance of tcpclient.c running on a Propeller.
 *
 *               The server must listen on a port known to client programs.
 */

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>


#ifdef __CATALINA__
#error This is NOT a Catalina Program - compile it with gcc on Cygwin or Linux.
#endif

#define WELL_KNOWN_PORT   666  // port this server will listen on 
                               // (port must be available on the PC)

#define SOCKET_TIMEOUT    10   // seconds timeout on socket send/recv

#define EAGAIN_TIMEOUT    1000 // time in usec before trying again on EAGAIN

#define EAGAIN_RETRIES    1000 // times to retry on EAGAIN before giving up

#define PERMANENT_CONNECT 1    // set to 1 for permanent connection
                               // set to 0 to close connection after each msg
                               // (note - must match p2_client.c)

#define BUFF_SIZE         1024

int main() {
    int addrlen;
    int new_socket;
    int msg_num = 1;
    int server_fd;
    struct sockaddr_in address;
    int len;
    struct timeval timeout;
    socklen_t tlen;
    int retries;

    // Create the socket
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    
    // Bind the socket to our IP address and a well known port
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr("0.0.0.0");
    address.sin_port = htons(WELL_KNOWN_PORT);
    if (bind(server_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
       perror("bind");
       close(server_fd);
       exit(EXIT_FAILURE);
    }

    // make socket non-blocking - this means we will get 
    // EAGAIN errors which we need to deal with
    len = fcntl(server_fd, F_SETFL, O_NONBLOCK);
    if (len < 0){
       perror("fcntl");
       close(server_fd);
       exit(EXIT_FAILURE);
    }

    // put a timeout on send and recv so we can detect closed connections
    timeout.tv_sec = SOCKET_TIMEOUT;
    timeout.tv_usec = 0;
    tlen = sizeof (timeout);
    if (setsockopt (server_fd, SOL_SOCKET, SO_SNDTIMEO, &timeout, tlen) < 0) {
       perror("setsockopt");
       exit(EXIT_FAILURE);
    }

    if (setsockopt (server_fd, SOL_SOCKET, SO_RCVTIMEO, &timeout, tlen) < 0) {
       perror("setsockopt");
       exit(EXIT_FAILURE);
    }
 
    // Listen for incoming connections
    if (listen(server_fd, 3) < 0) {
       perror("listen");
       close(server_fd);
       exit(EXIT_FAILURE);
    }

    printf("\nServer listening on port %d ...\n\n", WELL_KNOWN_PORT);

    // infinite loop to keep processing new connections
    while(1) { 

#if PERMANENT_CONNECT
       // accept incoming connection
       addrlen = sizeof(address);
       do {
          new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
          usleep(EAGAIN_TIMEOUT);
       } while ((new_socket < 0) && (errno == EAGAIN));
       if (new_socket < 0) {
          perror("accept");
          break;
       }

#endif

       // keep reading data until we get an error (other than EAGAIN)
       while (1) {  
          char buffer[BUFF_SIZE] = {0};
          char response[BUFF_SIZE] = {0};

#if !PERMANENT_CONNECT
          // accept incoming connection
          addrlen = sizeof(address);
          do {
             new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
             usleep(EAGAIN_TIMEOUT);
          } while ((new_socket < 0) && (errno == EAGAIN));
          if (new_socket < 0) {
              perror("accept");
              continue;
          }
#endif

          // Read data from client (retrying on EAGAIN)
          buffer[0] = 0;
          response[0] = 0;
          retries = 0;
          do {
             len = recv(new_socket, buffer, BUFF_SIZE, 0);
             usleep(EAGAIN_TIMEOUT);
          } while ((len < 0) && (errno == EAGAIN) && (retries++ < EAGAIN_RETRIES));

          if (retries >= EAGAIN_RETRIES) {
             close(new_socket);
             break;
          }

          if (len == 0) {
             printf("No data received\n");
             close(new_socket);
             break;
          }
          else if (len < 0) {
             perror("recv");
             close(new_socket);
             break;
          }
          printf("Rcvd: %s\n", buffer);
 
          // Send data to the client
          sprintf(response,"Message %d from the TCP Server\n", msg_num++);
          //printf("Send: %s\n", response);
          len = send(new_socket, response, strlen(response), MSG_DONTWAIT);
          if (len == 0) {
             printf("No data sent\n");
          }
          else if (len < 0) {
             perror("send");
             close(new_socket);
             break;
          }
   
#if !PERMANENT_CONNECT        
          // Close the client connection
          close(new_socket);   // Close the socket for this client
#endif
       }
    }
    
#if PERMANENT_CONNECT        
    // Close the client connection
    close(new_socket);
#endif

    // Close the listener
    close(server_fd);
    
    return 0;
}
