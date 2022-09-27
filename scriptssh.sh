#!/bin/bash
# Feito por Felipe Alves
SERVIDORES=(
  "172.22.228.122"
  
)

if [ -z "$1" ]; then
  echo "Você tem que digitar uma senha"
  echo " ./scriptssh.sh 'senha'"
  exit
fi

export SSHPASS=$1
 
for SERVIDOR in "${SERVIDORES[@]}"
do

  echo $SERVIDOR
   
  sshpass -e ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no $USER@$SERVIDOR || echo "FALHOU"
   
  ssh $USER@$SERVIDOR 'rm -rf .ssh'
   
  sshpass -e ssh-copy-id -i ~/.ssh/id_rsa.pub -o StrictHostKeyChecking=no $USER@$SERVIDOR || echo "FALHOU"
done
