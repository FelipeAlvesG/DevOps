#!/bin/bash
# Feito por Felipe Alves

#variaveis
HOST="192.168.50.250"
LOGIN="user"
SENHA="senha123"
BANCO="db_teste"

#comando para executar o backup, assim vai tudo trigers, gatilhos, tabelas, etc...

echo "Executando Restore do banco......"

mysql -h $HOST -u $LOGIN -p$SENHA -D $BANCO --default-character-set=utf8 < backup_banco.sql

echo "Finalizando Restauração do Banco $BANCO"

