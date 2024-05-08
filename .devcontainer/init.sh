#!/bin/bash

# Clonar os repositórios
git clone https://github.com/leonardo8787/Coletor.git /app/Coletor
git clone https://github.com/recicleUSP/Donor.git /app/Donor
git clone https://github.com/recicleUSP/manager.git /app/manager

# Instalar dependências npm
cd /app/Coletor
npm i --force

cd /app/Donor
npm i --force

cd /app/manager
npm i --force

# Mount USB drive
mkdir /mnt/g
mount -t drvfs G: /mnt/g

# Iniciar o bash
/bin/bash
