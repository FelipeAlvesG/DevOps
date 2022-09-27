#!/bin/bash
# Feito por Felipe Alves

echo "----------------------------------"
echo "Executando SCRIPT...."
#1º Atualizando o Linux e instalando o pacote de e-mail, caso não tenha
#2ºNão recomendado pois fica mais lento o script!!
#É necessario configurar as variaveis do pacote "mailto" para que o e-mail envie corretamente.
apt-get update && apt-get upgrade -y && apt-get install mailto -y
echo "----------------------------------"
echo "----------------------------------"
#Definindo os paremetros
alerta_percente=80 # Percentual de alerta a ser verificado
email_devOps="felipealves1995@gmail.com" # Coloca o e-mail do Analista da Infra
#Excluindo partições que não nos servira
echo "----------------------------------"
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r HD;
echo "----------------------------------"
do
  echo "$HD"
  hd_uso=$(echo "$HD" | awk '{ print $1}' | cut -d'%' -f1 )
  volumes=$(echo "$HD" | awk '{ print $2 }' )
  if [ $hd_uso -ge $alerta_percente ]; then
    echo  "Ficando sem espaço \" $volumes ( $hd_uso %) \" em $(hostname) como em $(date) "  |  
    mail -s  "Alerta: Quase sem espaço em disco $hd_uso "  " $email_devOps "  
  fi
done