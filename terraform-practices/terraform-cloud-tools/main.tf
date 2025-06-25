terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"
    workspaces {
      name = "terraform-cloud-tools"
    }
  }
}

variable "mensaje" {
  type    = string
  default = "Mensaje por defecto"
}

variable "secreto" {
  type      = string
  sensitive = true
}

resource "null_resource" "example" {
  triggers = {
    value  = var.mensaje
    secret = var.secreto
  }
}

output "saludo" {
  value = "Mensaje: ${var.mensaje}, Secreto: ${var.secreto}"
}

#prueba 2