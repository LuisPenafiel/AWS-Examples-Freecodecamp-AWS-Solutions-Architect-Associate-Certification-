# README.txt para la carpeta s3/iac/terraform/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para crear un bucket en S3 usando Terraform, que es una herramienta para manejar cosas en la nube con código.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código principal de Terraform. Dice cómo crear un bucket en S3, con su nombre y etiquetas (como "Nombre", "Dueño"). Es como un manual que le dice a Terraform qué hacer.

- **s3.tf**:
  Este archivo tiene más código de Terraform, pero se enfoca en el bucket y sus configuraciones. Lo separamos de main.tf para que sea más organizado.

## ¿Para qué usamos esta carpeta?
La usamos para practicar cómo hacer un bucket en S3 con Terraform, que es como usar un control remoto para crear y manejar cosas en la nube.