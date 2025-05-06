# README.txt para la carpeta s3/bash-scripts/

## ¿Qué hace esta carpeta?
Esta carpeta tiene scripts de Bash que uso para hablar directamente con S3 desde la terminal, usando comandos de AWS CLI. Es como tener un teléfono para darle órdenes a S3 sin usar herramientas como Terraform.

## ¿Qué hay dentro y qué hace cada script?

- **(Nota: Si no tienes scripts aquí, esta carpeta puede estar vacía o puedes añadir scripts como los de abajo)**

- **create-bucket.sh** (ejemplo):
  Este script crea un bucket en S3. Es como decirle a S3: "Haz una caja fuerte nueva para guardar mis archivos".

- **delete-bucket.sh** (ejemplo):
  Este script borra un bucket y sus archivos. Es como vaciar y tirar la caja fuerte cuando ya no la necesito.

- **delete-objects.sh**  (ejemplo):
  Este script borra un object y sus archivos.

- **get-newest-bucket.sh**  (ejemplo):
  Este script nos muestra el bucket mas nuevo que tengamos.

- **list-buckets**  (ejemplo):
  Este script nos da una lista de los buckets creados.

- **list-objects**  (ejemplo):
  Este script nos da una lista de los objects creados.

- **put-object**  (ejemplo):
  Este script genera objects.

- **sync**  (ejemplo):
  Este script genera objects de forma aleartoria y los sube al bucket.


## ¿Para qué usamos esta carpeta?
La usamos para practicar cómo hablar con S3 desde la terminal, sin usar herramientas más grandes como Terraform o Pulumi. Es una forma rápida de hacer cosas simples, como crear un bucket o subir un archivo.
