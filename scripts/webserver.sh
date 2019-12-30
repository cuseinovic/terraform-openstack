#!/bin/bash
apt update 
apt install -y apache2
echo "Hi Eveyrone !" | sudo tee /var/www/index.html 1>2
