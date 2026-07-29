output "load_balancer_url" {
  description = "URL do Load Balancer para acessar a aplicação"
  value       = "http://${aws_lb.web.dns_name}"
}

output "load_balancer_dns" {
  description = "DNS name do Load Balancer"
  value       = aws_lb.web.dns_name
}

output "ec2_public_ip" {
  description = "IP público da instância EC2 (acesso direto)"
  value       = aws_instance.web.public_ip
}

output "ec2_public_dns" {
  description = "DNS público da instância EC2"
  value       = aws_instance.web.public_dns
}

output "database_endpoint" {
  description = "Endpoint do banco de dados RDS (MySQL)"
  value       = aws_db_instance.mysql.endpoint
  sensitive   = true
}

output "database_name" {
  description = "Nome do banco de dados"
  value       = aws_db_instance.mysql.db_name
}

output "database_username" {
  description = "Usuário do banco de dados"
  value       = aws_db_instance.mysql.username
  sensitive   = true
}

output "security_group_ids" {
  description = "IDs dos Security Groups criados"
  value = {
    load_balancer = aws_security_group.lb_sg.id
    ec2           = aws_security_group.ec2_sg.id
    rds           = aws_security_group.db_sg.id
  }
}

output "instance_id" {
  description = "ID da instância EC2"
  value       = aws_instance.web.id
}

output "lb_target_group_arn" {
  description = "ARN do Target Group do Load Balancer"
  value       = aws_lb_target_group.web.arn
}