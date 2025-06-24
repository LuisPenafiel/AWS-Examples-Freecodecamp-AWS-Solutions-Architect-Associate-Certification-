# Módulo Terraform: Exploración de Terraform Cloud y Herramientas

## 📌 Descripción

Este módulo de Terraform se centra en la configuración y uso de **Terraform Cloud** como backend remoto, junto con la exploración de herramientas relacionadas del CLI de Terraform. Fue desarrollado con fines educativos para aprender:

- Gestión de estado remoto en la nube.
- Autenticación y configuración de workspaces remotos.
- Uso de comandos avanzados como `validate`, `console`, y `graph`.
- Integración con un entorno sin incurrir en costos de AWS hasta el 1 de julio de 2025, cuando se renueve el Free Tier.

La experiencia fortaleció la comprensión de la colaboración y el manejo de infraestructura como código en un entorno remoto.

---

## 📁 Estructura de Archivos

### `main.tf`

- Configura un backend remoto para Terraform Cloud con la organización `luis-terraform-learning` y el workspace `terraform-cloud-tools`.
- Incluye un recurso `null_resource` como prueba inicial para validar la conexión remota.

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

resource "null_resource" "example" {
  triggers = {
    value = "Testing Terraform Cloud"
  }
}