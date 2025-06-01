terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

# Crear un bucket de S3
resource "aws_s3_bucket" "my-bucket" {
  bucket = "encryption-fun-ab-135-luispenafiel-2025"

  tags = {
    Name        = "Encryption Practice Bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day15"
  }
}

# Subir el archivo con encriptación SSE-S3
resource "aws_s3_object" "hello-sse-s3" {
  bucket                  = aws_s3_bucket.my-bucket.id
  key                     = "hello-sse-s3.txt"
  source                  = "hello.txt"
  server_side_encryption  = "AES256"

  tags = {
    Name        = "Hello File - SSE-S3"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day15"
  }
}

# Subir el archivo con encriptación SSE-KMS (usando la llave por defecto de AWS/S3)
resource "aws_s3_object" "hello-sse-kms" {
  bucket                  = aws_s3_bucket.my-bucket.id
  key                     = "hello-sse-kms.txt"
  source                  = "hello.txt"
  server_side_encryption  = "aws:kms"
  # Nota: No especificamos sse_kms_key_id porque usamos la llave por defecto de AWS/S3
  # Si tuvieras una llave específica, usarías:
  # sse_kms_key_id = "a1bb2b48-ce90-49ff-bd06-f23705bcc0d8"

  tags = {
    Name        = "Hello File - SSE-KMS"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day15"
  }
}