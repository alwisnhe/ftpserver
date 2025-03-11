# Servidor FTPS

Este é um servidor FTPS simples usando a biblioteca `pyftpdlib`.

## Configuração

As seguintes variáveis de ambiente devem ser definidas para configurar o servidor FTPS:

- `FTPS_CERTFILE`: Caminho para o arquivo de certificado SSL.
- `FTPS_KEYFILE`: Caminho para o arquivo de chave privada.
- `FTPS_ENDERECO`: Endereço IP para o servidor (padrão: `0.0.0.0`).
- `FTPS_PORTA`: Porta para o servidor (padrão: `21`).
- `FTPS_USUARIO`: Nome de usuário para autenticação.
- `FTPS_SENHA`: Senha para autenticação.
- `FTPS_DIRETORIO`: Diretório raiz para o usuário.

## Execução

Para executar o servidor FTPS, execute o seguinte comando:

```sh
python3 src/ftps-server.py
```

Certifique-se de que todas as variáveis de ambiente necessárias estejam definidas antes de executar o comando.

## Exemplo

```sh
export FTPS_CERTFILE=/path/to/certfile.pem
export FTPS_KEYFILE=/path/to/keyfile.pem
export FTPS_ENDERECO=0.0.0.0
export FTPS_PORTA=21
export FTPS_USUARIO=usuario
export FTPS_SENHA=senha
export FTPS_DIRETORIO=/path/to/directory
export FTPS_MINPORTA=21100
export FTPS_MAXPORTA=21110

python3 src/ftps-server.py
```

## Construir a Imagem Docker

Construa a imagem Docker usando o comando:

```sh
make build
```

## Subir os Serviços

Suba os serviços definidos no `docker-compose.yml`:

```sh
make run-docker-compose
```

## Derrubar os Serviços

Derrube os serviços definidos no `docker-compose.yml`:

```sh
make down-docker-compose
```

## Limpar Diretórios de Dados e Certificados

Limpe os diretórios de dados e certificados:

```sh
make clean
```

## Mostrar log do serviço ftpsserver

Mostrar log do serviço ftpsserver

```sh
make logftp
```

## Parar o serviço ftpsserver

Parar o serviço ftpsserver

```sh
make stop
```

## Uso

### Variáveis de Ambiente

As seguintes variáveis de ambiente são usadas para configurar o servidor FTPS:

- `FTPS_CERTFILE`: Caminho para o arquivo de certificado SSL.
- `FTPS_KEYFILE`: Caminho para o arquivo de chave privada SSL.
- `FTPS_ENDERECO`: Endereço IP no qual o servidor FTPS irá escutar (padrão: `0.0.0.0`).
- `FTPS_PORTA`: Porta na qual o servidor FTPS irá escutar (padrão: `2121`).
- `FTPS_USUARIO`: Nome de usuário para autenticação no servidor FTPS.
- `FTPS_SENHA`: Senha para autenticação no servidor FTPS.
- `FTPS_DIRETORIO`: Diretório raiz para o servidor FTPS.
- `FTPS_MINPORTA`: Porta passiva inicial - Portas necessárias para serem também liberadas no docker
- `FTPS_MAXPORTA`: Porta passiva final - Portas necessárias para serem também liberadas no docker

### Exemplo de Uso

Subir os serviços:

```sh
make run-docker-compose
```

Acessar o servidor FTPS:

Use um cliente FTPS para se conectar ao servidor usando o endereço IP do host e a porta `2121`.

Derrubar os serviços:

```sh
make down-docker-compose
```

## Estrutura do Arquivo `docker-compose.yml`

```yaml
version: '3'
services:
  ftps:
    image: alwisnhe/ftpsserver
    build: .
    environment:
      - FTPS_CERTFILE=/path/to/certfile.pem
      - FTPS_KEYFILE=/path/to/keyfile.pem
      - FTPS_ENDERECO=0.0.0.0
      - FTPS_PORTA=2121
      - FTPS_USUARIO=usuario
      - FTPS_SENHA=senha
      - FTPS_DIRETORIO=/path/to/directory
      - FTPS_MINPORTA=21100
      - FTPS_MAXPORTA=21110
    ports:
      - "2121:2121"
      - "21:21"
      - "21100-21110:21100-21110"
    volumes:
      - ./data:/data
      - ./certs:/certs
```

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Contato

Para mais informações, entre em contato com alwisnhe@gmail.com