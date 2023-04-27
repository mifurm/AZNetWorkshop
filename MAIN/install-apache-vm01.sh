#!/bin/bash
sudo apt update
sudo apt-get install apache2 -y
echo "<body style="background-color:red\;"><h1>VM01</h1>" | tee /var/www/html/index.html	
sudo service apache2 restart