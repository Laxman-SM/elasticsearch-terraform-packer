#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install nginx

sudo service nginx stop
sudo service nginx start
sudo service nginx restart
sudo update-rc.d nginx defaults
