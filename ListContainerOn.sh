#!/bin/bash
# Feito por Felipe Alves


echo "Atualizando o Servidor"
apt-get update && apt-get upgrade -y && apt-get install curl -y 

echo "Puxando Container ativos"
curl --unix-socket /var/run/docker.sock http://localhost/containers/json >> Container_Ativos.txt

