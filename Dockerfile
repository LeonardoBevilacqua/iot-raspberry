#FROM python:3.10-slim-bullseye
FROM python:3.10-slim

ARG GOOGLE_API_KEY
ENV GOOGLE_API_KEY=${GOOGLE_API_KEY}

# Instala git e dependências básicas
RUN apt-get update && apt-get install -y git zbar-tools && rm -rf /var/lib/apt/lists/*

WORKDIR /app/Backend/servidor

# Copia o requirements.txt da pasta montada e instala dependências do projeto
COPY ./app/Backend/servidor/requirements.txt ./

# Instala dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install gunicorn

