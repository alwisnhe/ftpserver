from pyftpdlib.handlers import TLS_FTPHandler
from pyftpdlib.servers import FTPServer
from pyftpdlib.authorizers import DummyAuthorizer
import os

class FTPSServer:
    def __init__(self):
        # Ler as configurações das variáveis de ambiente
        self.certfile = os.getenv("FTPS_CERTFILE")
        self.keyfile = os.getenv("FTPS_KEYFILE")
        self.endereco = os.getenv("FTPS_ENDERECO", "0.0.0.0")
        self.porta = int(os.getenv("FTPS_PORTA", 21))
        self.usuario = os.getenv("FTPS_USUARIO")
        self.senha = os.getenv("FTPS_SENHA")
        self.diretorio = os.getenv("FTPS_DIRETORIO")
        self.minport = int(os.getenv("FTPS_MINPORT", 21100))
        self.maxport = int(os.getenv("FTPS_MAXPORT", 21110))

        # imprimir no console as variáveis de ambiente
        print("\n")
        print("Variáveis de ambiente:")
        print(f"FTPS_CERTFILE: {self.certfile}")
        print(f"FTPS_KEYFILE: {self.keyfile}")
        print(f"FTPS_ENDERECO: {self.endereco}")
        print(f"FTPS_PORTA: {self.porta}")
        print(f"FTPS_USUARIO: {self.usuario}")
        print(f"FTPS_SENHA: {self.senha}")
        print(f"FTPS_DIRETORIO: {self.diretorio}")
        print(f"FTPS_MINPORT: {self.minport}")
        print(f"FTPS_MAXPORT: {self.maxport}")
        
        # Validar que os parâmetros obrigatórios estão definidos
        if not all([self.certfile, self.keyfile, self.usuario, self.senha, self.diretorio]):
            raise ValueError("As variáveis de ambiente obrigatórias não estão definidas.")

    def configuracao(self):

        # Verificar se os arquivos de certificado e chave existem
        if not os.path.isfile(self.certfile):
            raise FileNotFoundError(f"Certificado SSL não encontrado: {self.certfile}")
        if not os.path.isfile(self.keyfile):
            raise FileNotFoundError(f"Chave privada não encontrada: {self.keyfile}")

        authorizer = DummyAuthorizer()
        authorizer.add_user(self.usuario, self.senha, self.diretorio, perm="elradfmw")

        handler = TLS_FTPHandler
        handler.certfile = self.certfile  # Certificado SSL
        handler.keyfile = self.keyfile    # Chave privada
        handler.authorizer = authorizer
        handler.passive_ports = range(self.minport, self.maxport)

        return handler

    def conexao(self, handler):
        address = (self.endereco, self.porta)  # Endereço e porta para o servidor FTPS
        server = FTPServer(address, handler)
        return server

    def main(self):
        handler = self.configuracao()
        server = self.conexao(handler)
        server.serve_forever()

if __name__ == "__main__":
    ftp_server = FTPSServer()
    ftp_server.main()
