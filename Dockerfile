FROM ubuntu:latest

# Instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    git curl wget unzip \
    openjdk-11-jdk \
    usbutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar Node.js e ferramentas relacionadas
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g expo-cli firebase-tools

# Instalar Android SDK
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip -O android-sdk-tools.zip \
    && unzip -qq android-sdk-tools.zip -d /opt/android-sdk \
    && rm android-sdk-tools.zip

# Adicionar Android SDK ao PATH
ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools/bin
ENV PATH $PATH:$ANDROID_HOME/platform-tools

# Aceitar todas as licenças do Android SDK
RUN yes | $ANDROID_HOME/cmdline-tools/bin/sdkmanager --licenses

# Instalar Android Emulator CLI
RUN apt-get install -y android-sdk-emulator

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar o arquivo init.sh
COPY .devcontainer/init.sh /app/init.sh

# Conceder permissões de execução ao arquivo init.sh
RUN chmod +x /app/init.sh

# Iniciar o emulador de Android com interface gráfica
CMD ["emulator", "-avd", "Pixel_3_API_30", "-gpu", "host"]
