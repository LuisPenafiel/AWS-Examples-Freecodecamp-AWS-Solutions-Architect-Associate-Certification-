# Módulo Terraform: Exploración de Terraform Cloud y Herramientas

## 📌 Descripción

Este módulo de Terraform se centra en la configuración y uso avanzado de **Terraform Cloud** como backend remoto, integrándolo con GitHub y explorando diversas funcionalidades. Fue desarrollado con fines educativos para aprender:

- Gestión de estado remoto en la nube y su versionado.
- Integración con control de versiones (GitHub) para triggers automáticos.
- Configuración y uso de variables y datos sensibles (secretos) en Terraform Cloud.
- Resolución de problemas como alineación de variables, declaración de outputs sensibles y ajustes de directorios de trabajo.
- Comprensión teórica de políticas de seguridad con Sentinel.
- Simulación de infraestructura híbrida utilizando módulos locales y recursos simulados (`null_resource`).
- Uso de un entorno sin incurrir en costos de AWS hasta el 1 de julio de 2025, cuando se renueva el Free Tier.

La experiencia fortaleció la comprensión de la automatización, la seguridad de datos, la colaboración en infraestructura como código y la gestión de estado remoto.

---

## 📁 Estructura de Archivos

### `main.tf`
- Configura un backend remoto para Terraform Cloud con la organización `luis-terraform-learning` y el workspace `terraform-cloud-tools`.
- Incluye módulos para simular servidores locales y en la nube (`local_server` y `cloud_server`).
- Utiliza variables (`TF_VAR_mensaje`, `TF_VAR_secreto`, `TF_VAR_server_name`, `TF_VAR_cloud_name`) y outputs para gestionar datos personalizados y seguros.

### `modules/`
- Contiene subcarpetas `local_server` y `cloud_server`, cada una con su propio `main.tf` para simular recursos locales y en la nube.

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

variable "TF_VAR_server_name" {
  type        = string
  default     = "local-server-01"
  description = "Nombre del servidor local"
}

variable "TF_VAR_cloud_name" {
  type        = string
  default     = "cloud-server-01"
  description = "Nombre del servidor en la nube virtual"
}

module "local" {
  source     = "./modules/local_server"
  server_name = var.TF_VAR_server_name
}

module "cloud" {
  source     = "./modules/cloud_server"
  cloud_name = var.TF_VAR_cloud_name
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

output "hybrid_infrastructure" {
  value = "Local: ${module.local.local_server_name}, Cloud: ${module.cloud.cloud_server_name}"
}
```

### Requisitos Previos
Cuenta gratuita en Terraform Cloud.
Token de autenticación generado mediante terraform login.
Repositorio de GitHub conectado con Terraform Working Directory configurado como terraform-practices/terraform-cloud-tools.
Variables definidas en Terraform Cloud: TF_VAR_mensaje, TF_VAR_secreto, TF_VAR_server_name, TF_VAR_cloud_name.

## 🛠️ Comandos Utilizados
Desde la raíz de terraform-cloud-tools, ejecuta:

terraform init: Inicializa el backend remoto y descarga proveedores.
terraform plan: Previsualiza los cambios a aplicar (desencadenado por GitHub).
terraform apply: Aplica la configuración (requiere aprobación manual o auto-apply).
terraform validate: Valida la sintaxis del código.
terraform console: Prueba expresiones interactivas.
terraform state list: Lista los recursos en el estado remoto.
terraform state show: Muestra detalles de un recurso específico.
terraform destroy: Elimina los recursos de prueba.

### 📚 Aprendizajes Adicionales
Integración con GitHub: Automatización de planes y applies mediante triggers en la rama main.
Gestión de Variables y Secretos: Uso de variables personalizables (TF_VAR_mensaje) y protección de datos sensibles (TF_VAR_secreto) con outputs sensibles.
Estado Remoto: Visualización y versionado del estado en Terraform Cloud, incluyendo comparación de estados y adición de triggers.
Políticas de Sentinel (Teórico): Creación de una política ficticia para validar etiquetas, preparándose para entornos de seguridad.
Simulación de Infraestructura Híbrida: Uso de módulos locales para simular servidores locales y en la nube, integrándolos en un solo proyecto con outputs.

## 🧹 Limpieza
Ejecuta terraform destroy para eliminar el recurso null_resource y mantener el entorno limpio.
Nota: Este módulo no incurre en costos de AWS, ya que evita recursos en la nube hasta julio.

#### Instrucciones para Guardar
1. Navega a la carpeta:
   ```bash
   cd /workspaces/AWS-Examples-Freecodecamp-AWS-Solutions-Architect-Associate-Certification-/terraform-practices/terraform-cloud-tools
   ```