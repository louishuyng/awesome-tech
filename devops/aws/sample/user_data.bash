#!bin/bash
yum update -y
yum install httpd -y
systemctl start httpd.service
systemctl enable httpd
echo " This is server *1* in AWS Region US-EAST-1 in AZ US-EAST-1B " > /var/www/html/index.html
