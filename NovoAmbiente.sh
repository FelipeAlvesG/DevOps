#!/bin/bash
#Script criado por Felipe Alves e Davi Pedro
#Antes de Executar o Script, instale o GIT na máquina

echo "======================================"
echo "      Atualizando o Servidor"
echo "======================================"
apt-get update && apt-get upgrade -y

echo "======================================"
echo "     Instalando Configurando Docker   "
echo "======================================"
#Instalando Pacote para  o apt usar `https`
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
#Adc chave gpg no repositorio Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#Adcinando o docker para uso do apt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
#Atulizando os pacotes
sudo apt update
#Definindo as policitas do Docker
sudo apt-cache policy docker-ce
#Instalando o Dcoker
sudo apt install docker-ce -y
sudo systemctl start docker

echo "======================================"
echo "      Instalando o Docker Compose     "
echo "======================================"
#Baixando e jogando para a pasta ../bin
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Dando permissao de execucao no arquivo compose
sudo chmod +x /usr/local/bin/docker-compose
#Verificando Versao
docker-compose --version

echo "Verifique se a mensagem acima e de versao esta correta conforme a de baixo!"
echo "docker-compose version 1.26.0, build"


sudo systemctl status docker


