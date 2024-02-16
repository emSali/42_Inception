**INCEPTION**

The aim of this project is to understand and be able to use Docker. 

Furthermore the following services are used:

- Nginx
- MariaDB
- WordPress

**NGINX** 

Links: 
- https://medium.com/nerd-for-tech/deploy-a-custom-nginx-docker-image-and-push-it-to-docker-hub-118f1ab2186b

Building Docker Image: 
1. docker build -t <new_image_name> .
2. Verify -> docker images
3. docker run -d --name <name-container> -p 8080:80 <new_image_name>
4. Verify -> docker ps -a
5. check localhost:8080

Remove Docker Container & Image:
1. docker stop <name-container>
2. docker rm <name-container>
3. docker rmi -f <new_image_name>
