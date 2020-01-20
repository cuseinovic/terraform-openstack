#!/bin/bash
apt update 
apt install -y apache2
echo "<h1>mon nom est: $(hostname)</h1>" | sudo tee /var/www/html/index.html 1>2
