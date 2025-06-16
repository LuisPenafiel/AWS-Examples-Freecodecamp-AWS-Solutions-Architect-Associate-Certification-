
module "day01" {
  source      = "./modules/day01"
  bucket_name = "mi-bucket-unico-2025-luispenafiel-day01-20250612"
  allowed_ip  = "2.206.152.175"
}

module "day02" {
  source        = "./modules/day02"
  instance_type = "t2.micro"
  ami           = "ami-00ac244ee0ad9050d"  # AMI valida
}

module "day03" {
  source     = "./modules/day03"
  vpc_cidr   = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}