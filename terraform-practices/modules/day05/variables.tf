variable "db_instance_class" {
  description = "Clase de la instancia RDS"
  type        = string
  default     = "db.t2.micro"
}

variable "db_engine" {
  description = "Motor de la base de datos"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Versión del motor de la base de datos"
  type        = string
  default     = "5.6.51"
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
  default     = "Tontodelculo123_"  # password
}
