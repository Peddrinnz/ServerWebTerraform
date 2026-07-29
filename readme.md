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
mkdir terraform-projeto
cd terraform-projeto
```

### 2. Inicializar o Terraform

Baixe os provedores e dependências:

```bash
terraform init
```

### 3. Validar a configuração

Verifique se os arquivos Terraform estão corretos:

```bash
terraform validate
```

### 4. Verificar o plano

Veja o que será criado antes de aplicar:

```bash
terraform plan
```

### 5. Aplicar a infraestrutura

Execute o deploy dos recursos:

```bash
terraform apply
```

Confirme digitando `yes` quando solicitado.

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