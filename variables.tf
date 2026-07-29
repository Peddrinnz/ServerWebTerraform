variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default     = "MinhaSenha123!"
  sensitive   = true
}

variable "environment" {
  description = "Ambiente"
  type        = string
  default     = "dev"
}