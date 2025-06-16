# Módulo Terraform: Instancia EC2 con Servidor Web Apache

## Descripción

Este módulo de Terraform crea una instancia EC2 en AWS con un servidor web Apache configurado automáticamente mediante un script `user_data`. Fue desarrollado como parte de un ejercicio para aprender a automatizar la configuración de servidores en la nube de forma modular y reutilizable.

## Estructura de Archivos

- **main.tf**  
  Define los recursos principales de AWS:
  - Crea una instancia EC2 (por ejemplo, `t2.micro`)
  - Configura un script `user_data` que instala Apache y sirve una página web personalizada

- **variables.tf**  
  Declara las variables de entrada del módulo:
  - `instance_type`: Tipo de instancia EC2 (por ejemplo, `"t2.micro"`)
  - `ami`: ID de la AMI para la instancia EC2 (por ejemplo, `"ami-0abcdef1234567890"`)

- **outputs.tf**  
  Expone información útil después de la implementación:
  - IP pública de la instancia EC2 creada

## Uso del Módulo

Incluye el módulo en tu archivo `main.tf` principal:

```hcl
module "day02" {
  source        = "./modules/day02"
  instance_type = "t2.micro"
  ami           = "ami-0abcdef1234567890"  # Reemplaza con una AMI válida para tu región (ej. eu-central-1)
}
```

## Ejecución de Comandos
Desde el directorio raíz, ejecuta:

```bash
terraform init     # Inicializa el entorno de Terraform
terraform plan     # Muestra los cambios que se aplicarán
terraform apply    # Crea los recursos definidos
``` 

## Eliminación de Recursos
Para destruir los recursos creados:

```bash
terraform destroy
```
