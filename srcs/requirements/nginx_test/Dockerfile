#FROM nginx:1.10.1-alpine

#RUN FROM debian:buster
#RUN apt -y update && apt install -y nginx && apt install openssl -y

#COPY index.html /usr/share/nginx/html

#EXPOSE 8080

#CMD ["nginx", "-g", "daemon off;"]

# Use the official Nginx image as the base image
FROM nginx:latest

# Copy SSL certificate and key to the container
COPY nginx.crt /etc/nginx/nginx.crt
COPY nginx.key /etc/nginx/nginx.key

# Remove the default Nginx configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/

# Expose ports
EXPOSE 80
EXPOSE 443

