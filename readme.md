# Terraform AWS Project

## Pré-requisitos

Antes de executar o projeto, instale e configure:

- Terraform 1.0 ou superior
  - Download: https://www.terraform.io/downloads
- AWS CLI
  - Download: https://aws.amazon.com/cli/
  - Configuração: `aws configure`
- Chave SSH (opcional)
  - Para acessar a instância EC2 diretamente

## Estrutura dos arquivos

Este projeto utiliza os seguintes arquivos:

- `provider.tf` — Configuração do provedor AWS
- `variables.tf` — Declaração de variáveis do projeto
- `main.tf` — Definição dos recursos
- `outputs.tf` — Valores de saída

## Passo a passo

### 1. Preparar o ambiente

Clone o repositório ou crie uma pasta para o projeto:

```bash
git clone <seu-repo-url>
cd terraform
```

### 2. Configurar GitHub Actions

Vá em `Settings > Secrets and variables > Actions` no GitHub e crie os seguintes secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `TF_STATE_BUCKET`
- `TF_STATE_KEY`
- `TF_LOCK_TABLE`

> O bucket S3 e a tabela DynamoDB devem já existir na AWS e ter as permissões necessárias para o GitHub Actions.

### 3. Executar o pipeline localmente (opcional)

Para testar localmente, use:

```bash
terraform init \
  -backend-config="bucket=<seu-bucket>" \
  -backend-config="key=<seu-key>" \
  -backend-config="region=us-east-2" \
  -backend-config="dynamodb_table=<sua-tabela>"
terraform validate
terraform plan
terraform apply -auto-approve
```

### 4. Como funciona o workflow do GitHub Actions

O workflow `./github/workflows/deploy.yml` realiza:

1. Checkout do código
2. Instalação do Terraform
3. Configuração das credenciais AWS do GitHub Secrets
4. `terraform init` usando backend S3 e lock DynamoDB
5. `terraform validate`
6. `terraform plan`
7. Upload do `tfplan` como artifact
8. `terraform apply` automático para push na branch `main`

### 5. Deploy via GitHub Actions

O pipeline é disparado em:

- `push` na branch `main`
- `pull_request` contra `main`

No caso de PR, ele executa `terraform init`, `validate` e `plan`.
No caso de `push` para `main`, ele também aplica o plano.

## Verificação dos resultados

Após a execução, o Terraform deve retornar os outputs principais:

- `load_balancer_url` — URL do Load Balancer
- `ec2_public_ip` — IP público da instância EC2

Para testar:

1. Abra o navegador
2. Acesse o `load_balancer_url`
3. Verifique se a aplicação responde corretamente

## Limpeza dos recursos

Remova os recursos criados para evitar custos:

```bash
terraform destroy
```

Confirme com `yes` quando solicitado.