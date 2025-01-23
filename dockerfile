FROM python:3.11.11-bullseye

WORKDIR /app

# Criar uma pasta para o certificado
RUN mkdir /app/cert
RUN mkdir /app/src
COPY requirements.txt /app/
COPY /src/ftps-server.py /app/src/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r /app/requirements.txt
RUN pip install pyOpenSSL

EXPOSE 21

CMD ["/bin/bash"]
ENTRYPOINT ["python", "/app/src/ftps-server.py"]
