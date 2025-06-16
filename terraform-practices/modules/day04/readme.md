# Módulo Terraform: VPC con Subredes en AWS

## Descripción 📝
Módulo para crear una VPC con subredes públicas/privadas en AWS usando variables avanzadas. Ideal para implementar redes complejas de forma modular.

## Características principales 🛠️
- ✅ Creación de VPC con CIDR personalizable
- ✅ Subredes públicas y privadas configurables
- ✅ Tags automáticos para todos los recursos
- ✅ Outputs para integración con otros módulos

## Estructura de archivos 📂
modules/day04/
├── main.tf # Recursos principales
├── variables.tf # Variables de entrada
└── outputs.tf # Salidas útiles

text

## Variables requeridas 📌
| Variable         | Ejemplo                          |
|------------------|----------------------------------|
| `vpc_name`       | `"my-vpc-prod"`                 |
| `vpc_cidr`       | `"10.0.0.0/16"`                 |
| `public_subnets` | `["10.0.1.0/24", "10.0.2.0/24"]`|
| `private_subnets`| `["10.0.3.0/24", "10.0.4.0/24"]`|

# Cómo usar este módulo 🚀

```hcl
module "network" {
  source          = "./modules/day04"
  vpc_name        = "vpc-produccion"
  vpc_cidr        = "10.100.0.0/16"
  public_subnets  = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnets = ["10.100.101.0/24", "10.100.102.0/24"]
}
```
# Outputs disponibles 📤
hcl
output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnet_ids
}

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