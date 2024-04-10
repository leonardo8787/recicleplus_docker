FROM ubuntu:latest

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    git curl wget unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instale Node.js e ferramentas relacionadas
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g expo-cli firebase-tools

# Copie o arquivo init.sh para o diretório raiz do workspace
COPY .devcontainer/init.sh /app/init.sh

# Conceda permissões de execução ao arquivo init.sh
RUN chmod +x /app/init.sh

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app
