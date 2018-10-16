#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBAIN_FRONTEND=noninteractive apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y 
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx python-certbot-nginx python 
sudo mv nginx.conf /etc/nginx/nginx.conf
sudo nginx
sudo certbot -n --nginx --redirect --rsa-key-size 2048 --agree-tos --email Jons-tech-support@pm.me --no-eff-email -d jonstechsupport.com
sudo cp cert-renew.sh /etc/cron.weekly
