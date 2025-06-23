# Módulo Terraform: Infraestructura de Red Reutilizable (Día 06)

## 📌 Descripción

Este módulo demuestra cómo implementar infraestructura de red modular y reutilizable con **Terraform**, desplegando una **VPC con subredes públicas y privadas** mediante un módulo reutilizable. El objetivo principal fue profundizar en las buenas prácticas de *Infrastructure as Code (IaC)*, la modularidad y la gestión de recursos en AWS.

---

## 📁 Estructura de Archivos

### `main.tf`

- Llama al módulo de red reutilizable para definir la configuración de la VPC.
- Crea una VPC llamada `adventure-park-vpc` con el bloque CIDR `10.1.0.0/16`.
- Define subredes:
  - **Públicas:** `10.1.1.0/24` y `10.1.2.0/24`
  - **Privadas:** `10.1.3.0/24` y `10.1.4.0/24`
- Se distribuyen entre las zonas de disponibilidad `eu-central-1a` y `eu-central-1b`.
- Expone *outputs* útiles como IDs de la VPC y subredes.

### `variables.tf` (heredado del módulo de red)

Declara variables de entrada para personalizar la red:

| Variable         | Descripción                                     | Ejemplo                 |
|------------------|-------------------------------------------------|-------------------------|
| `vpc_name`       | Nombre de la VPC                                | `"adventure-park-vpc"`  |
| `vpc_cidr`       | Rango CIDR de la VPC                            | `"10.1.0.0/16"`         |
| `public_subnets` | Lista de subredes públicas                      | `["10.1.1.0/24", "10.1.2.0/24"]` |
| `private_subnets`| Lista de subredes privadas                      | `["10.1.3.0/24", "10.1.4.0/24"]` |

---

## 🧠 Aprendizajes Clave

- ✅ Desarrollo y uso de **módulos reutilizables** en Terraform.
- ✅ Parámetros variables para configuraciones flexibles.
- ✅ Uso de *outputs* para exponer detalles de la infraestructura.
- ✅ Validación exitosa de la VPC y subredes en la consola de AWS.
- ✅ Eliminación responsable de recursos con `terraform destroy` para evitar costos innecesarios.


## ▶️ Uso del Módulo

Incluye el módulo en tu archivo `main.tf` raíz:

```hcl
module "day06" {
  source = "./modules/day06"
}
```


## ⚙️ Ejecución de Comandos
Desde el directorio raíz del proyecto, ejecuta:

```bash
terraform init     # Inicializa el entorno de Terraform
terraform plan     # Previsualiza los cambios
terraform apply    # Aplica la infraestructura definida
```
## 🧨 Eliminación de Recursos
Para eliminar los recursos y evitar cargos en AWS:

```bash
terraform destroy
```

## 💡 Recomendación: Siempre elimina los recursos una vez completadas las pruebas para mantener un entorno de desarrollo económico y limpio.

## 🔐 Buenas Prácticas
Mantén tu infraestructura modular para facilitar la reutilización.

Usa variables para parametrizar configuraciones.

Verifica los outputs para obtener detalles clave de los recursos creados.

Ejecuta terraform destroy al finalizar para evitar cargos innecesarios.

