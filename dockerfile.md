# Documentação do Dockerfile

Este documento descreve cada linha do Dockerfile utilizado para configurar e executar um servidor FTPS.

## Dockerfile

```dockerfile
# Usando a imagem base do Python 3.11.11 com Debian Bullseye
FROM python:3.11.11-bullseye

# Definindo o diretório de trabalho dentro do contêiner
WORKDIR /app

# Criar uma pasta para o certificado
RUN mkdir /app/cert

# Criar uma pasta do projeto
RUN mkdir /app/src

# Copiar o arquivo de requisitos para o diretório de trabalho
COPY requirements.txt /app/

# Copiar o script Python para o diretório do projeto
COPY src/ftps-server.py /app/src/

# Atualizar o pip para a versão mais recente
RUN pip install --upgrade pip

# Instalar as dependências listadas no arquivo requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Instalar a biblioteca pyOpenSSL para gerar o certificado
RUN pip install pyOpenSSL

# Expor a porta 21 para o servidor FTPS
EXPOSE 21

# Definir o comando padrão para iniciar um shell Bash
CMD ["/bin/bash"]

# Definir o ponto de entrada para executar o script Python
ENTRYPOINT ["python", "/app/src/ftps-server.py"]


# Como construir a imagem Docker, publicar e executar o contêiner

## Construir a Imagem Docker

```sh
docker build -t ftpsserver .
```

## Renomear a Imagem Docker para o Repositório Docker Hub

```sh
docker tag ftpsserver alwisnhe/ftpsserver
```

## Publicar a Imagem Docker no Repositório Docker Hub

```sh
docker push alwisnhe/ftpsserver
```
