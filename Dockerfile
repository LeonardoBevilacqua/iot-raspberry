#FROM python:3.10-slim-bullseye
FROM python:3.10-slim

ARG GOOGLE_API_KEY
ENV GOOGLE_API_KEY=${GOOGLE_API_KEY}

# Instala git e dependências básicas
RUN apt-get update && apt-get install -y git zbar-tools && rm -rf /var/lib/apt/lists/*

# Clona o repositório diretamente
ARG CACHEBUSTER=1
RUN git clone https://github.com/natdfernandes/Projeto-IoT-Python.git /app && \
    chmod -R 755 /app

RUN ls -R /app/Backend/servidor

WORKDIR /app/Backend/servidor

# Instala dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install gunicorn

