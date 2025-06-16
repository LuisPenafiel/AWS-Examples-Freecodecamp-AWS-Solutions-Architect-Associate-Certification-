# Terraform Module: AWS VPC with Outputs and Local Values

## Description

This Terraform module creates a basic VPC with a subnet in AWS, utilizing outputs to display useful information and local values to simplify configuration. It was developed as part of an exercise to learn how to manage cloud networks in a modular and reusable way.

## Features

- Creates a VPC with specified CIDR block
- Creates a subnet within the VPC
- Uses local values for naming and counts
- Provides outputs for easy integration with other modules

## File Structure
├── main.tf # Defines the main AWS resources
├── variables.tf # Declares input variables for the module
└── outputs.tf # Exposes useful output information

text

## Resources Created

- AWS VPC with specified CIDR range
- Subnet within the created VPC

## Input Variables

| Variable Name | Description | Example Value | Required |
|---------------|-------------|---------------|----------|
| `vpc_cidr` | CIDR range for the VPC | "10.0.0.0/16" | Yes |
| `subnet_cidr` | CIDR range for the subnet | "10.0.1.0/24" | Yes |

## Outputs

| Output Name | Description |
|-------------|-------------|
| `vpc_id` | ID of the created VPC |
| `subnet_id` | ID of the created subnet |

## Usage

1. Include the module in your main Terraform configuration:

```hcl
module "day03" {
  source     = "./modules/day03"
  vpc_cidr   = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}
```
## Initialize and apply the configuration:

```bash
terraform init     # Inicializa el entorno de Terraform
terraform plan     # Muestra los cambios que se aplicarán
terraform apply    # Crea los recursos definidos
``` 

## Cleanup
Para destruir los recursos creados:

```bash
terraform destroy
```
