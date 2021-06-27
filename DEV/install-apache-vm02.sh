#!/bin/bash
sudo apt update
sudo apt-get install apache2 -y
echo "<body style="background-color:green\;"><h1>VM02</h1>" | tee /var/www/html/index.html
service apache2 restart