# Variáveis de Ambiente
FTPS_CERTFILE=cert/ftps_local_hub.crt
FTPS_KEYFILE=cert/ftps_local_hub.key
FTPS_ENDERECO=0.0.0.0
FTPS_PORTA=2121
FTPS_USUARIO=guest
FTPS_SENHA=guest
FTPS_DIRETORIO=/

# Alvo para rodar o programa Python
run:
	FTPS_CERTFILE=$(FTPS_CERTFILE) \
	FTPS_KEYFILE=$(FTPS_KEYFILE) \
	FTPS_ENDERECO=$(FTPS_ENDERECO) \
	FTPS_PORTA=$(FTPS_PORTA) \
	FTPS_USUARIO=$(FTPS_USUARIO) \
	FTPS_SENHA=$(FTPS_SENHA) \
	FTPS_DIRETORIO=$(FTPS_DIRETORIO) \
	python3 src/ftps-server.py
build:
	docker build -t ftpsserver .

push:
	docker push alwisnhe/ftpsserver
