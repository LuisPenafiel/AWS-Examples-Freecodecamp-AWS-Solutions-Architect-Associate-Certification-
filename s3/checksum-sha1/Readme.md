# README.txt para la carpeta s3/checksum-sha1/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para practicar cómo usar checksums con SHA-1 en S3 usando Terraform. Los checksums son como "huellas digitales" que verifican si un archivo cambió.

## ¿Qué hay dentro y qué hace cada archivo?

- **main.tf**:
  Este archivo tiene el código de Terraform para crear un bucket en S3, subir un archivo (example.txt), y calcular su checksum SHA-1 para asegurarnos de que no cambió. También compara el checksum que calculamos nosotros con el que S3 calcula.

- **example.txt**:
  Este es el archivo que subimos al bucket. Es como un dibujo que guardamos en la caja fuerte y verificamos con una huella digital.

## ¿Para qué usamos esta carpeta?
La usamos para aprender cómo los checksums SHA-1 nos ayudan a verificar si un archivo cambió, asegurándonos de que se subió correctamente a S3.