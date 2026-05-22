variable "db_master_username" {
  description = "Usuario administrador de la base de datos"
  type        = string
}

variable "db_master_password" {
  description = "Password del usuario administrador"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

variable "subnet_privada_datos1_id" {
  description = "ID de la primera subnet privada de datos"
  type        = string
}

variable "subnet_privada_datos2_id" {
  description = "ID de la segunda subnet privada de datos"
  type        = string
}

variable "sg_rds_id" {
  description = "ID del Security Group para RDS"
  type        = string
}

