#!/usr/bin/env bash

apt-get update
apt-get install -y nginx mongodb pkg-config

# Required for sharp
curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -

rm /etc/nginx/sites-enabled/default
ln -fs /vagrant/provisioning/nginx.conf /etc/nginx/sites-enabled/default
