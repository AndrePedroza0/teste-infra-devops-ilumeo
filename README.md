# Teste Técnico – Suporte / Infra / DevOps - Ilumeo
Projeto de demonstração de scripts para o teste da vaga de Analista de ti JR na Ilumeo


## Sobre o projeto

Este projeto foi desenvolvido para o teste técnico.

O objetivo é realizar o backup de um volume Docker utilizando um script Bash, criando um arquivo com os dados do volume e realizando o envio para um servidor remoto através do protocolo SCP.
Também foi configurada uma pipeline utilizando GitHub Actions para simular etapas de testes automatizados e deploy.

---

## Tecnologias utilizadas

- Linux / Ubuntu (WSL2)
- Bash Script
- Docker
- Docker Compose
- SSH / SCP
- GitHub Actions

---

## Funcionamento

O script de backup realiza as seguintes etapas:

1. Verifica se o Docker está instalado no ambiente.
2. Realiza o backup do volume Docker informado.
3. Cria um arquivo compactado utilizando o comando `tar`.
4. Envia o arquivo de backup para um servidor remoto utilizando SCP.

---

## Ambiente de teste

O arquivo `docker-compose.yml` cria um ambiente SSH local para testes, simulando um servidor remoto responsável por receber os backups enviados via SCP.

Os testes foram realizados em ambiente local utilizando:

- Docker Desktop
- Ubuntu através do WSL2
- PowerShell

---

## Como executar

### 1. Iniciar o ambiente de teste

```bash
docker compose up -d
```

### 2. Criar o volume Docker

```bash
docker volume create volume_docker
```

### 3. Adicionar um arquivo de teste no volume (opcional)

```bash
docker run --rm \
-v volume_docker:/dados \
alpine \
sh -c "echo teste > /dados/teste.txt"
```

### 4. Executar o script de backup

Dar permissão de execução:

```bash
chmod +x scripts/docker/backup_docker.sh
```

Executar:

```bash
./scripts/docker/backup_docker.sh
```

---

## GitHub Actions

Foi configurada uma pipeline utilizando GitHub Actions para simular um fluxo básico de CI/CD.

A pipeline executa:

### Teste automatizado

```bash
echo "Running tests"
```

### Deploy automatizado

```bash
echo "Deploy"
```

O workflow está localizado em:

```text
.github/workflows/pipeline.yml
```

---

## Autor

**Andre Pedroza**

Projeto desenvolvido para estudos de Infraestrutura, Docker e automação DevOps.
