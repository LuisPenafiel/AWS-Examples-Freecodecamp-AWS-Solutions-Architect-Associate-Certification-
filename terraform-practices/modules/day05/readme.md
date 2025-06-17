# Módulo Terraform: Base de Datos RDS con Data Sources

## 📌 Descripción

Este módulo de Terraform crea una instancia de **Amazon RDS** utilizando **data sources** para integrarse con una **VPC existente** (del Día 3). Fue desarrollado con fines educativos, enfrentando desafíos técnicos como:

- Zonas de disponibilidad (AZs) incompatibles.
- Combinaciones inválidas de clase de instancia y versión del motor.
- Configuración de subredes.
- Versiones incompatibles de MySQL.

La experiencia ayudó a profundizar en la gestión de bases de datos en la nube de forma modular.

---

## 📁 Estructura de Archivos

### `main.tf`

- Usa `data "aws_vpc"` y `data "aws_subnets"` para reutilizar la VPC del Día 3.
- Crea una instancia RDS con el motor MySQL.
- Define un `aws_security_group` que permite acceso al puerto `3306` desde una IP específica.
- Configura un `aws_db_subnet_group`, solucionando errores iniciales por cobertura incompleta de AZs.
- Ajusta la versión del motor y clase de instancia a configuraciones compatibles:
  - **Versión:** `5.7.44`
  - **Clase:** `db.t3.micro`
  - **Subredes:** Se añadió una subred manualmente en `eu-central-1a`.

### `variables.tf`

Declara las variables de entrada:

| Variable           | Descripción                                           | Ejemplo              |
|--------------------|-------------------------------------------------------|----------------------|
| `db_instance_class`| Clase de instancia RDS                                | `"db.t3.micro"`      |
| `db_engine`        | Motor de la base de datos                             | `"mysql"`            |
| `db_name`          | Nombre de la base de datos                            | `"mydb"`             |
| `db_username`      | Usuario administrador                                 | `"admin"`            |
| `db_password`      | Contraseña (marcada como **sensible**)               | `"********"`         |
| `engine_version`   | Versión del motor                                     | `"5.7.44"`           |
| `allowed_ip`       | IP autorizada para acceso                             | `"*.***.**.**/32"` |

> 🔐 `db_password` y `allowed_ip` deben configurarse mediante **variables de entorno** por seguridad.

### `outputs.tf`

Expone información útil post implementación:

- `rds_endpoint` – Endpoint de conexión a la base de datos.
- `rds_username` – Usuario administrador configurado.

---

## ▶️ Uso del Módulo

Incluye el módulo en tu `main.tf` principal:

```hcl
module "day05" {
  source             = "./modules/day05"
  db_instance_class  = "db.t3.micro"
  db_engine          = "mysql"
  db_name            = "mydb"
  db_username        = "admin"
  db_password        = var.db_password
  engine_version     = "5.7.44"
  allowed_ip         = var.allowed_ip
}
```

## ⚙️ Ejecución de Comandos
Desde el directorio raíz del proyecto, ejecuta:

```bash
Copiar
Editar
terraform init     # Inicializa el entorno
terraform plan     # Previsualiza los cambios
terraform apply    # Aplica los cambios
``` 

## ⚠️ Notas Importantes
Asegúrate de que la VPC del Día 3 (my-vpc-day03) tenga al menos dos subredes en diferentes AZs (como eu-central-1a y eu-central-1b). Si no, crea una subred adicional manualmente desde la consola de AWS.

Configura variables de entorno antes de aplicar:

```bash
Copiar
Editar
export TF_VAR_db_password="tu_contraseña_segura"
export TF_VAR_allowed_ip="*.***.**.**/32"
```

## 🧨 Eliminación de Recursos
Para eliminar todos los recursos creados:

```bash
Copiar
Editar
terraform destroy
```

## 🔐 Seguridad
Antes de hacer git push:

## Asegúrate de que tu archivo .gitignore incluye:

gitignore
Copiar
Editar
*.tfvars