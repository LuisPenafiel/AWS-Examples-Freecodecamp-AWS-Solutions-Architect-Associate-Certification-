variable "db_instance_class" {
  description = "Clase de la instancia RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "Motor de la base de datos"
  type        = string
  default     = "mysql"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true  # Esto oculta la contraseña en los outputs
  default     = null  # Sin valor por defecto para forzarla como variable de entorno
}

variable "engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "5.7.44"
}

variable "allowed_ip" {
  description = "IP permitida para acceder al RDS"
  type        = string
  default     = null  # Sin valor por defecto para forzarla como variable de entorno
}