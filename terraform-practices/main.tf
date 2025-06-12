module "day01" {
  source      = "./modules/day01"
  bucket_name = "mi-bucket-unico-2025-luispenafiel-day01-20250612"
  allowed_ip  = "2.206.152.175"  # Tu IP
}

module "day02" {
  source        = "./modules/day02"
  instance_type = "t2.micro"
  ami           = "ami-00e89f3f4910f40a1"  # AMI de Amazon Linux 2 en eu-central-1 (verifica la más reciente)
}