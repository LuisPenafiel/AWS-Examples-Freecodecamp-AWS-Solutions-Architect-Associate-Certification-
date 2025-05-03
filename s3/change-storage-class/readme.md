# README.txt para la carpeta s3/storage-class/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para practicar cómo cambiar la clase de almacenamiento de un archivo en S3 usando Terraform. Las clases de almacenamiento son como "estantes" con diferentes precios.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear un bucket en S3, subir un archivo (hello.txt) con la clase de almacenamiento STANDARD_IA (un estante barato), y luego cambiarlo a STANDARD (un estante más usado).

- **hello.txt**:
  Este es el archivo que subimos al bucket. Es como un dibujo que guardamos en la caja fuerte y movimos de un estante a otro.

## ¿Para qué usamos esta carpeta?
La usamos para aprender cómo cambiar dónde se guarda un archivo en S3 (de un estante barato a uno más usado), y entender que las clases de almacenamiento tienen diferentes precios.