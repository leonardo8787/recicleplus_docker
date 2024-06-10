#!/bin/bash

# Clonar os repositórios
git clone https://github.com/recicleplusplus/Coletor.git /app/Coletor
git clone https://github.com/recicleplusplus/Donor.git /app/Donor
git clone https://github.com/recicleplusplus/manager.git /app/manager

# Instalar dependências npm
cd /app/Coletor
npm i --force

cd /app/Donor
npm i --force

cd /app/manager
npm i --force

# Iniciar o bash
/bin/bash
