# README.txt para la carpeta terraform-practice/day01/

## Descripción
Hoy aprenderé a crear un bucket S3 y aplicar una política avanzada que restringe el acceso solo a una IP específica, usando Terraform con variables y outputs.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear un bucket S3 y aplicar una política que limita el acceso a una IP específica, usando variables para personalizarlo y outputs para mostrar información.

- **variables.tf**:
  Este archivo define las variables que usamos, como el nombre del bucket y la IP permitida.

- **terraform.tfvars**:
  Aquí guardo los valores específicos para el nombre del bucket y la IP que quiero usar.

## ¿Cómo hacer esta práctica en Codespaces?
Aquí están los pasos para completar esta práctica usando Terraform en Codespaces.

### Paso 1: Crear la carpeta y archivos
Crea la carpeta y los archivos necesarios:
```bash
cd /workspaces/AWS-Examples/terraform-practice
mkdir day01
cd day01
nano main.tf
nano variables.tf
nano terraform.tfvars