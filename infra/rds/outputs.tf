output "rds_endpoint" {
  description = "Endpoint de conexión RDS"
  value       = aws_db_instance.technova.address
}

output "rds_port" {
  description = "Puerto MySQL"
  value       = aws_db_instance.technova.port
}

output "rds_identifier" {
  description = "Nombre de la instancia RDS"
  value       = aws_db_instance.technova.id
}

