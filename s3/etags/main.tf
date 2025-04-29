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
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-terraform-etag-bucket-luispenafiel-2025"

  tags = {
    Name        = "My ETag bucket"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day12"
  }
}

# Habilitar versionado en el bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Crear la primera versión del objeto
resource "aws_s3_object" "example-object-v1" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  key    = "myfile.txt"
  source = "myfile.txt"
  etag   = filemd5("myfile.txt")

  tags = {
    Name        = "Example Object V1"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day12"
  }
}

# Crear la segunda versión del objeto
resource "aws_s3_object" "example-object-v2" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  key    = "myfile.txt"
  source = "myfile-v2.txt"
  etag   = filemd5("myfile-v2.txt")

  tags = {
    Name        = "Example Object V2"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day12"
  }
}

# Crear una tercera versión del objeto solo si el ETag coincide
resource "aws_s3_object" "example-object-v3" {
  bucket = aws_s3_bucket.my-s3-bucket.id
  key    = "myfile.txt"
  source = "myfile-v3.txt"
  etag   = filemd5("myfile-v3.txt")

  # Condición: Solo subir si el ETag de la versión 2 coincide
  lifecycle {
    precondition {
      condition     = aws_s3_object.example-object-v2.etag == "630f6c185d6e2046accff474d2c9c6c5"
      error_message = "ETag does not match, object may have been modified."
    }
  }

  tags = {
    Name        = "Example Object V3"
    Environment = "Dev"
    Owner       = "LuisPenafiel"
    Project     = "AWS-Examples-Day12"
  }
}

# Exportar los ETags de las versiones
output "object_etag_v1" {
  value = aws_s3_object.example-object-v1.etag
}

output "object_etag_v2" {
  value = aws_s3_object.example-object-v2.etag
}

output "object_etag_v3" {
  value = aws_s3_object.example-object-v3.etag
}