variable "bucket_name" {
  description = "Nombre único del bucket S3"
  type        = string
}

variable "allowed_ip" {
  description = "IP permitida para acceder al bucket"
  type        = string
}
