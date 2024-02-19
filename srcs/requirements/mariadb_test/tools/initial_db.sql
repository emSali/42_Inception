CREATE DATABASE IF NOT EXISTS testdb;
CREATE USER IF NOT EXISTS 'esali'@'%' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON testdb.* TO 'esali'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';