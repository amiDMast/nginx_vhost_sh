#!/bin/bash
av="/etc/nginx/sites-avalible/"
en="/etc/nginx/sites-enabled/"
mkdir -p $av
mkdir -p $en
domain=""
path=""
conf=".conf"
echo "vhost conf fot nginx"
echo "enter site domain"
read domain
echo "enter path to index.php  (ex /var/www/....)"
read path
echo "path is "
echo $path
s1="server {
      listen  80;
      server_name   "  
s2=";
      root   "
s3=";
     location / {
         index index.php;
         try_files $uri $uri/ /index.php?q=$uri&$args;
         }
     location ~ \.php$ {
         fastcgi_pass   127.0.0.1:9000;
         fastcgi_index  index.php;
         include        fastcgi_params;
         fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
     }
 }"
echo  -e "$s1$domain$s2$path$s3">> $av$domain$conf
echo "Success $domain$conf"
cat $av$domain$conf
ln -s $av$domain$conf $en$domain$conf
nginx -s reload