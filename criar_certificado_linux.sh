#!/bin/bash

# Cria o diretório "certs" se não existir
mkdir -p cert

# Gera a chave privada
openssl genpkey -algorithm RSA -out cert/ftps_local_hub.key -pkeyopt rsa_keygen_bits:2048

# Gera o certificado autoassinado
openssl req -new -x509 -key cert/ftps_local_hub.key -out cert/ftps_local_hub.crt -days 365 -subj "/CN=127.0.0.1"

echo "Certificado e chave gerados em $(pwd)/cert"

echo "Criando diretórios para simular o FTPS"

mkdir -p data
mkdir -p data/ftp
mkdir -p data/ftp/notfis311
mkdir -p data/ftp/notfis311/sucesso
mkdir -p data/ftp/notfis311/falha
mkdir -p data/ftp/notfis311/emprocessamento
mkdir -p data/ftp/notfis50
mkdir -p data/ftp/notfis50/sucesso
mkdir -p data/ftp/notfis50/falha
mkdir -p data/ftp/notfis50/emprocessamento

echo "Copiando arquivos de exemplo para os diretórios correspondentes"
cp notfis31.txt data/ftp/notfis311/
cp notfis50.txt data/ftp/notfis50/

