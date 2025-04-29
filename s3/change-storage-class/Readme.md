## Create a bucket

aws s3 mb s3://class-fun-ab-6346-luispenafiel-2025

## Create a file

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://class-fun-ab-6346-luispenafiel-2025 --storage-class STANDARD_IA

## Cleanup

aws s3 rm s3://class-fun-ab-6346-luispenafiel-2025/hello.txt
aws s3 rb s3://class-fun-ab-6346-luispenafiel-2025