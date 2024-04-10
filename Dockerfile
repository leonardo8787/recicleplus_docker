# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git curl \
    && apt-get install -y docker.io \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instale Node.js e ferramentas relacionadas
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g expo-cli firebase-tools

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Clona o repositório do projeto
RUN git clone https://github.com/leonardo8787/Coletor.git 
RUN git clone https://github.com/recicleUSP/Donor.git 
RUN git clone https://github.com/recicleUSP/manager.git

