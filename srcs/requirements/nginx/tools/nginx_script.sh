#!/bin/bash


#generates self-signed SSL/TLS certificate and private key using OpenSSL
#req -x509 - generate self-signed SSL/TLS certificate signing request (CSR)
#-nodes - dont encrypt private key with passphrase
#-days - nr days in whcih ceriticate is valid for
#-newkey - new private key with length 4096 has to be generated
#-keyout - where to save key 
#-out - where to save certificate
#-subj subject of ceritifcate (country, location, organization, organizational unit, common name)


#check if certicate exists already
if [ ! -f /etc/ssl/certs/nginx.crt ]; then
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42 Lisboa/CN=Emily";
fi


# allows process to run as main proccess (PID 1) -> replaced with nginx -g deamon off 
exec "$@"
