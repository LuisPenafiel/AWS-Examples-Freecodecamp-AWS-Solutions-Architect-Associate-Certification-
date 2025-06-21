variable "db_password" {
  description = "Contraseña de la base de datos RDS"
  type        = string
  sensitive   = true
}

variable "allowed_ip" {
  description = "IP permitida para acceder al RDS"
  type        = string
}
