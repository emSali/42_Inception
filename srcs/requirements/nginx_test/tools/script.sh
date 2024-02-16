
#generates self-assigned SSL/TLS certificate and private key using OpenSSL
#req -x509 - generate self-signed SSL/TLS certificate signing request (CSR)
#-nodes - dont encrypt private key with passphrase
#-days - nr days in whcih ceriticate is valid for
#-newkey - new private key with length 2048 has to be generated
#-subj subject of ceritifcate (country, location, organization, organizational unit, common name)
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out $CERTS_ -subj "/C=MO/L=KH/O=1337/OU=student/CN=esali.42.fr"

server {

	#server listens for incoming connections on port 443 (default port for HTTPS)
	listen 443 ssl;
	listen [::]443 ssl;

	server_name esali.42.fr;

	#specify directory of SSL/TLS
	ssl_certificate etc/ssl/certs/nginx-selfsigned.crt;
    	ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
	
	#using TLS protocole 1.3
	ssl_protocols TLSv1.3;




}


