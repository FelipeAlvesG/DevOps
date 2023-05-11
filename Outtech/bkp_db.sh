#!/bin/bash
#Script criado por Felipe Alves
#Script para Efutar backups de banco do ODOO e enviando para um servidor remoto

#Variaveis para o ambiente
BACKUP_DIR=./diretorioBkps
ODOO_DATABASE='nomeBase'
ADMIN_PASSWORD='senhaBanco'

echo "Criando diretorio para os backups!"
echo "=================================="
#Criando diretorio para os backups
mkdir -p ${BACKUP_DIR}

echo "Gerando Backup zipado!"
echo "======================"
#Gerando backup com o Curl
curl -X POST \
    -F "master_pwd=${ADMIN_PASSWORD}" \
    -F "name=${ODOO_DATABASE}" \
    -F "backup_format=zip" \
    -o ${BACKUP_DIR}/${ODOO_DATABASE}.$(date +%F).zip \
    http://localhost:8069/web/database/backup


#Deletando backups antigos a mais de 7 dias
find ${BACKUP_DIR} -type f -mtime +7 -name "${ODOO_DATABASE}.*.zip" -delete

echo "ENVIADO ARQUIVOS PARA O SERVIDOR REMOTO DE DBs"
#Enviado para o servidor externo, copia redundante nao so local
scp -r ${BACKUP_DIR}/* root@IpHostRemoto:~/'pastaDestinoRemotoouLocal'
