FROM ubuntu:latest

# Update the system and install necessary dependencies
RUN apt-get update && apt-get install -y \
    lsb-release gnupg curl wget unzip git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install the latest version of Node.js
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g expo-cli firebase-tools @expo/ngrok@^4.1.0 \ 
    && npm i -g eas-cli \
    && curl -o- -L https://yarnpkg.com/install.sh | bash

# Install ADB
RUN apt-get install -y android-tools-adb

# Set the working directory inside the container
WORKDIR /app

# Copy the init.sh file to the root directory of the workspace
COPY .devcontainer/init.sh /app/init.sh
COPY .devcontainer/instrucoes.txt /app/instrucoes.txt

# Grant execute permissions to the init.sh file
RUN chmod +x /app/init.sh

# Execute init.sh
CMD ["/bin/bash", "/app/init.sh"]
