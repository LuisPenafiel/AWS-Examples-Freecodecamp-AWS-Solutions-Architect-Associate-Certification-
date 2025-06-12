# Módulo Terraform: Bucket S3 con Restricción de IP

## Descripción
Este módulo de Terraform crea un bucket S3 en AWS con una política de seguridad que restringe el acceso **únicamente a una IP específica**. Fue desarrollado como parte de un ejercicio para entender cómo organizar código de Terraform de manera modular y reutilizable.

## Estructura de Archivos
### `main.tf`
Define los recursos principales de AWS:
- Crea un bucket S3
- Implementa una política que permite acceso solo desde la IP especificada

### `variables.tf`
Declara las variables de entrada del módulo:
- `bucket_name`: Nombre único del bucket S3
- `allowed_ip`: Dirección IP autorizada para acceder al bucket (ej: `"192.168.1.1"`)

### `outputs.tf`
Expone información útil después de la implementación:
- Nombre del bucket creado
- ARN (Amazon Resource Name) del bucket

## Uso del Módulo
1. Incluye el módulo en tu configuración principal (`main.tf` raíz):
```hcl
module "day01" {
  source      = "./modules/day01"
  bucket_name = "mi-bucket-unico-2025-luispenafiel-day01-20250612"  # Reemplaza con un nombre único
  allowed_ip  = "X.xx.xxx.xxx"  # Reemplaza con tu IP pública
}
```

2. Ejecución de comandos
Desde el directorio raíz ejecuta:

```bash
terraform init     # Inicializa el módulo
terraform plan     # Verifica los cambios
terraform apply    # Aplica la configuración
```

3. Eliminación de recursos
Para destruir los recursos creados:

```bash
terraform destroy  # Destruye los recursos gestionados
```