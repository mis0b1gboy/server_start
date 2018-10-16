#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBAIN_FRONTEND=noninteractive apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y 
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx python python-certbot-nginx 
sudo mv nginx.conf /etc/nginx/nginx.conf
sudo nginx
