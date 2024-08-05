#!/bin/bash

[ ! $1 ] || [ ! $2 ] || [ ! $3 ] && echo "Please provide required arguments" && exit

applicationConfig="/etc/nginx/sites-available/$1"

sudo touch $applicationConfig
sudo echo "server {" > $applicationConfig
sudo echo "    listen $3;" >> $applicationConfig
[ $4 ] && sudo echo "    server_name $4;" >> $applicationConfig
sudo echo "    location / {" >> $applicationConfig
sudo echo "        proxy_pass $2;" >> $applicationConfig
sudo echo "    }" >> $applicationConfig
sudo echo "}" >> $applicationConfig

sudo ln -s $applicationConfig /etc/nginx/sites-enabled/

sudo systemctl restart nginx

