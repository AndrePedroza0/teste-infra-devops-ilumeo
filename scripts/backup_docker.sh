#!/bin/bash

# Script para realizar backup de um volume Docker
# O processo cria um arquivo e envia para um servidor remoto

# Define o nome do volume Docker que será realizado o backup
VOLUME="volume_docker"

# Define o local onde o arquivo de backup será salvo temporariamente
BACKUP="/tmp/backup_docker.tar.gz"

# Define o servidor remoto que receberá o backup via SCP
SERVIDOR="usuario@servidor:/backup"

echo "Iniciando backup..."

# Verifica se Docker está instalado
if ! docker --version > /dev/null 2>&1; then
    echo "Docker não encontrado."
    exit 1
fi

# Cria um container temporário para compactar o volume Docker
echo "Criando backup..."

docker run --rm \
-v "$VOLUME:/dados" \
-v "/tmp:/backup" \
alpine tar -czf /backup/backup_docker.tar.gz -C /dados .


# Realiza o envio do arquivo de backup para o servidor remoto
echo "Enviando backup..."

scp "$BACKUP" "$SERVIDOR"

# Exibe mensagem informando que o processo foi concluído
echo "Backup finalizado com sucesso!"
