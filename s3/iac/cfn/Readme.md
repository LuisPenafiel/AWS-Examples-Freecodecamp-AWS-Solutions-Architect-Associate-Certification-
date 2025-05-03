# README.txt para la carpeta s3/iac/cfn/

## ¿Qué hace esta carpeta?
Esta carpeta tiene archivos para crear un bucket en S3 usando CloudFormation, que es una herramienta de AWS para hacer cosas en la nube con "recetas" escritas en un lenguaje especial (YAML).

## ¿Qué hay dentro y qué hace cada archivo?

- **template.yaml**:
  Este archivo es la "receta" escrita en YAML. Dice cómo crear un bucket en S3, con su nombre y algunas configuraciones. Es como escribir una lista de instrucciones para armar una caja fuerte.

- **deploy-stack.sh**:
  Este script usa la receta (template.yaml) para crear el bucket en S3. Es como darle la lista de instrucciones a AWS y decirle: "Haz esto ahora".

- **delete-stack.sh**:
  Este script borra el bucket que creamos con CloudFormation. Es como decirle a AWS: "Tira la caja fuerte que hicimos, ya no la necesito".

## ¿Para qué usamos esta carpeta?
La usamos para practicar cómo hacer cosas en S3 con CloudFormation, que es una forma diferente de manejar la nube, usando recetas en lugar de herramientas como Terraform o Pulumi.