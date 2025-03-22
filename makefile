# Variáveis de Ambiente
FTPS_CERTFILE=cert/ftps_local.crt
FTPS_KEYFILE=cert/ftps_local.key
FTPS_ENDERECO=0.0.0.0
FTPS_PORTA=2121
FTPS_USUARIO=guest
FTPS_SENHA=guest
FTPS_DIRETORIO=/
FTPS_MINPORT=21100
FTPS_MAXPORT=21110

# Alvo para rodar o programa Python
run:
	FTPS_CERTFILE=$(FTPS_CERTFILE) \
	FTPS_KEYFILE=$(FTPS_KEYFILE) \
	FTPS_ENDERECO=$(FTPS_ENDERECO) \
	FTPS_PORTA=$(FTPS_PORTA) \
	FTPS_USUARIO=$(FTPS_USUARIO) \
	FTPS_SENHA=$(FTPS_SENHA) \
	FTPS_DIRETORIO=$(FTPS_DIRETORIO) \
	FTPS_MINPORT=$(FTPS_MINPORT) \
	FTPS_MAXPORT=$(FTPS_MAXPORT) \
	python3 src/ftps-server.py

build:
	docker build -t ftpsserver .

rename:
	docker tag ftpsserver alwisnhe/ftpsserver

push:
	docker push alwisnhe/ftpsserver

run-docker:
	FTPS_CERTFILE=$(FTPS_CERTFILE) \
	FTPS_KEYFILE=$(FTPS_KEYFILE) \
	FTPS_ENDERECO=$(FTPS_ENDERECO) \
	FTPS_PORTA=$(FTPS_PORTA) \
	FTPS_USUARIO=$(FTPS_USUARIO) \
	FTPS_SENHA=$(FTPS_SENHA) \
	FTPS_DIRETORIO=$(FTPS_DIRETORIO) \
	FTPS_MINPORT=$(FTPS_MINPORT) \
	FTPS_MAXPORT=$(FTPS_MAXPORT) \
	docker run -it ftpsserver

run-docker-compose:
	docker-compose up -d

down-docker-compose:
	docker-compose down

logftp:
	docker logs -f ftpsserver

stop:
	docker stop ftpsserver
	docker rm -f ftpsserver
