#!/bin/bash

#Definindo as variaves e usando o awk para processar os dados
# Felipe Alves
#
echo "----------------------------------"
echo "Executando SCRIPT...."
#Disco atual em USO
HD=`df -h . | tail -n1 | awk '{print $1}'`
#Espaço total do disco
espaco=`df -h | grep $HD | awk '{print $2}'`
#Espaço em uso do disco
usado=`df -h | grep $HD | awk '{print $3}'`
#Espaço livre no disco
free=`df -h | grep $HD | awk '{print $4}'`
#Espaço usado em percentual
percent=`df -h | grep $HD | awk '{print $5}'`
#Apenas um echo de informações do Disco
echo "----------------------------------"
echo "
      Espaço TOTAL do HD: $espaco,
      Espaço Utilizado: $usado, 
      Espaço Livre: $free,
      Porcentagem de uso: $percent
      "
echo "----------------------------------"
while :
do
  if [ $percent > "50%" ]; then
    echo "HD Cheio, favor verificar"
    break
  else
    echo "HD com Espaço!"
    break
  fi
done