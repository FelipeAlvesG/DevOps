#!/bin/bash
# Feito por Felipe Alves


#Só de teste, simples, da para colocar para salvar com data, escolher outros locais, automatizar com horarios, etc.....
#Definindo as variaveis, pode colocar em outro arquivo para ficar mais seguro e utilizar em mais de um arquivo.
HOST="192.168.50.250"
LOGIN="user"
SENHA="senha123"
BANCO="db_teste"

#comando para executar o backup, assim vai tudo trigers, gatilhos, tabelas, etc...

echo "Executando backup......"
mysqldump -h $HOST -u $LOGIN -p$SENHA --opt --routines --triggers --default-character-set=utf8 $BANCO > backup_banco.sql

echo "Finalizando backup do Banco $BANCO"