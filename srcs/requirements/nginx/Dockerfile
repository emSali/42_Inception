# Start of imgae with a node base image
FROM	debian:bookworm

#install needed packages with answering yes to all prompts (-y)
RUN	apt-get update && apt-get install -y \
	nginx \
	openssl

# only allowed port
EXPORT	443
