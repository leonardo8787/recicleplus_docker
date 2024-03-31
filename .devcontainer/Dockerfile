# Use a imagem oficial do Ubuntu como base
FROM ubuntu:latest

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update \
    && apt-get install -y git curl \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g expo-cli firebase-tools

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Clona o repositório do projeto
RUN git clone https://github.com/leonardo8787/Coletor.git 
RUN git clone https://github.com/recicleUSP/Donor.git 
RUN git clone https://github.com/recicleUSP/manager.git 

# Exponha a porta necessária para executar o servidor da aplicação (se necessário)
# EXPOSE <porta>

# Comando para executar a aplicação quando o contêiner for iniciado
#CMD ["npm", "start"]