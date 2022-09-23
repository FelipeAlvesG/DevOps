#!/bin/bash

echo "Atualizando o Servidor"
apt-get update 
apt-get upgrade -y

echo "Instalando programas necessarios"
apt-get install apache2 -y
apt install unzip -y
apt install samba -y
apt install mysql-server-8.0 -y

echo "Baixando os arquivos do Servidor Web"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

cd linux-site-dio-main
cp -R * /var/www/html/

