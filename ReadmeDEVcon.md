# README.txt para la carpeta devcontainer/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos que configuran mi entorno de trabajo en Codespaces, que es como una computadora en la nube. Es como un manual que le dice a Codespaces qué herramientas necesito para trabajar (como Terraform, AWS CLI, etc.).

## ¿Qué hay dentro y qué hace cada archivo?

- **devcontainer.json**:
  Este archivo es el "manual principal". Le dice a Codespaces qué imagen usar (una especie de sistema operativo base) y qué hacer después de crear mi entorno. Por ejemplo, ejecuta un script llamado "post-create.sh" para instalar cosas.

- **install-aws-cli.sh**:
  Este script instala AWS CLI, que es una herramienta para hablar con Amazon S3 y otros servicios de AWS desde la terminal. Es como instalar un teléfono para dar órdenes a la nube.

- **install-terraform.sh**:
  Este script instala Terraform, que es una herramienta para crear y manejar cosas en la nube (como buckets de S3) usando código. Es como instalar un control remoto para manejar S3.

- **post-create.sh**:
  Este script es como una lista de tareas que se ejecutan cuando mi entorno de Codespaces se crea. Llama a otros scripts (como "install-aws-cli.sh" y "install-terraform.sh") para instalar todo lo que necesito.

- **setup.sh**:
  Este script hace configuraciones adicionales, como ajustar permisos o instalar otras herramientas pequeñas que necesito para trabajar.

## ¿Para qué usamos esta carpeta?
La usamos para que mi Codespaces tenga todo listo para trabajar con S3 y otras herramientas de AWS. Sin estos archivos, tendría que instalar todo a mano cada vez que empiezo.
