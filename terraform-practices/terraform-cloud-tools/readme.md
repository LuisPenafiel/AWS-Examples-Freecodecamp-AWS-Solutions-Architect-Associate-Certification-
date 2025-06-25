# Módulo Terraform: Exploración de Terraform Cloud y Herramientas

## 📌 Descripción

Este módulo de Terraform se centra en la configuración y uso de **Terraform Cloud** como backend remoto, integrándolo con GitHub para automatización y gestionando variables y secretos. Fue desarrollado con fines educativos para aprender:

- Gestión de estado remoto en la nube.
- Integración con control de versiones (GitHub) para triggers automáticos.
- Configuración y uso de variables y datos sensibles (secretos) en Terraform Cloud.
- Resolución de problemas como la alineación de variables y la declaración de outputs sensibles.
- Uso de un entorno sin incurrir en costos de AWS hasta el 1 de julio de 2025, cuando se renueve el Free Tier.

La experiencia fortaleció la comprensión de la automatización, la seguridad de datos, y la colaboración en infraestructura como código.

---

## 📁 Estructura de Archivos

### `main.tf`

- Configura un backend remoto para Terraform Cloud con la organización `luis-terraform-learning` y el workspace `terraform-cloud-tools`.
- Incluye un recurso `null_resource` con triggers que utilizan variables (`TF_VAR_mensaje` y `TF_VAR_secreto`).
- Declara variables y un output sensible para gestionar datos personalizados y seguros.

### `README.md`

- Este archivo, que documenta el propósito y los pasos realizados.

---

## 🚀 Uso

Para replicar esta configuración, incluye el siguiente bloque en tu `main.tf`:

```hcl
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "luis-terraform-learning"  # Reemplaza con tu organización
    workspaces {
      name = "terraform-cloud-tools"
    }
  }
}

variable "TF_VAR_mensaje" {
  type        = string
  default     = "Mensaje por defecto"
  description = "Un mensaje personalizado para la salida"
}

variable "TF_VAR_secreto" {
  type        = string
  sensitive   = true
  description = "Un secreto sensible para pruebas"
}

resource "null_resource" "example" {
  triggers = {
    value  = var.TF_VAR_mensaje
    secret = var.TF_VAR_secreto
  }
}

output "saludo" {
  value     = "Mensaje: ${var.TF_VAR_mensaje}, Secreto: ${var.TF_VAR_secreto}"
  sensitive = true
}
```

### Requisitos Previos
Cuenta gratuita en Terraform Cloud.
Token de autenticación generado mediante terraform login.
Repositorio de GitHub conectado con Terraform Working Directory configurado como terraform-practices/terraform-cloud-tools.

## 🛠️ Comandos Utilizados
Desde la raíz de terraform-cloud-tools, ejecuta:

terraform init: Inicializa el backend remoto y descarga proveedores.
terraform plan: Previsualiza los cambios a aplicar (desencadenado por GitHub).
terraform apply: Aplica la configuración (requiere aprobación manual o auto-apply).
terraform validate: Valida la sintaxis del código.
terraform console: Prueba expresiones interactivas.
terraform destroy: Elimina los recursos de prueba.

## 🧹 Limpieza
Ejecuta terraform destroy para eliminar el recurso null_resource y mantener el entorno limpio.
Nota: Este módulo no incurre en costos de AWS, ya que evita recursos en la nube hasta julio.

#### Instrucciones para Guardar
1. Navega a la carpeta:
   ```bash
   cd /workspaces/AWS-Examples-Freecodecamp-AWS-Solutions-Architect-Associate-Certification-/terraform-practices/terraform-cloud-tools
   ```