#!/bin/bash

# Backup de volume Docker

VOLUME="volume_docker"
BACKUP="/tmp/backup_docker.tar.gz"


echo "Iniciando backup..."


if ! docker --version > /dev/null 2>&1; then
    echo "Docker não encontrado."
    exit 1
fi


echo "Criando backup do volume..."


docker run --rm \
-v "$VOLUME:/dados" \
-v "/tmp:/backup" \
alpine tar -czf /backup/backup_docker.tar.gz -C /dados .


if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso."
else
    echo "Erro ao criar backup."
    exit 1
fi


echo "Processo finalizado."


