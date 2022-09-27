#!/bin/bash
# Feito por Felipe Alves

echo "----------------------------------"
echo "Executando SCRIPT...."
alerta_percente=80 # Percentual de alerta a ser verificado
email_devOps="felipealves1995@gmail.com" # Coloca o e-mail do Analista da Infra
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r HD;
do
  echo "$HD"
  usep=$(echo "$HD" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$HD" | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
    mail -s "Alert: Almost out of disk space $usep%" "$email_devOps"
  fi
done