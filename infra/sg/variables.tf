variable "vpc_id" {
  description = "ID de la VPC donde se crean los SG"
  type        = string
}

variable "mi_ip" {
  description = "IP pública del usuario para acceso SSH"
  type        = string
}
