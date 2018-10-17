#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBAIN_FRONTEND=noninteractive apt-get install software-properties-common -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y 
sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 python-certbot-apache python libxml2 libxml2-dev libxml2-utils libaprutil1 libaprutil1-dev libapache2-modsecurity libapache2-mod-evasive
mkdir ~/www
chmod +744 www
cp /var/www/html/index.html ~/www
sudo cp conf/apache2.conf /etc/apache2/
sudo cp conf/000-default.conf /etc/apache2/sites-available/
sudo cp conf/ssl.conf /etc/apache2/mods-available/
sudo cp conf/host.conf /etc/
sudo cp conf/sysctl.conf /etc/
sudo cp conf/security.conf /etc/apache2/conf-available/
sudo cp conf/modsecurity.conf /etc/modsecurity/
sudo cp modsecurity.d /etc/apache2/
cd /tmp
sudo wget -O SpiderLabs-owasp-modsecurity-crs.tar.gz https://github.com/SpiderLabs/owasp-modsecurity-crs/tarball/master
sudo tar -zxvf SpiderLabs-owasp-modsecurity-crs.tar.gz
sudo cp -R SpiderLabs-owasp-modsecurity-crs-*/* /etc/modsecurity/
sudo rm SpiderLabs-owasp-modsecurity-crs.tar.gz
sudo rm -R SpiderLabs-owasp-modsecurity-crs-*
sudo mv /etc/modsecurity/modsecurity_crs_10_setup.conf.example /etc/modsecurity/modsecurity_crs_10_setup.conf

cd /etc/modsecurity/base_rules
for f in * ; do sudo ln -s /etc/modsecurity/base_rules/$f /etc/modsecurity/activated_rules/$f ; done
cd /etc/modsecurity/optional_rules
for f in * ; do sudo ln -s /etc/modsecurity/optional_rules/$f /etc/modsecurity/activated_rules/$f ; done 

sudo service apache2 restart
sudo sysctl -p
sudo certbot -n --apache --redirect --rsa-key-size 2048 --agree-tos --email Jons-tech-support@pm.me --no-eff-email -d jonstechsupport.com
sudo cp cert-renew.sh /etc/cron.weekly
sudo su 
echo 'tmpfs     /run/shm     tmpfs     defaults,noexec,nosuid     0     0' >> /etc/fstab
exit


