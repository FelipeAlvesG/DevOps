#!/bin/bash

#Definindo as variaves e usando o awk para processar os dados
# Felipe Alves
#
echo "Executando SCRIPT...."
#Disco atual em USO
HD=`df -h . | tail -n1 | awk '{print $1}'`
#Espaço total do disco
espaco=`df -h | grep $HD | awk '{print $2}'`
#Espaço em uso do disco
usado=`df -h | grep $HD | awk '{print $3}'`
#Espaço livre no disco
free=`df -h | grep $HD | awk '{print $4}'`
#Apenas um echo de informações do Disco
echo "HD atual de: $espaco, utilizado: $usado, Espaço Livre: $free"