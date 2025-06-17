module "day01" {
  source      = "./modules/day01"
  bucket_name = "mi-bucket-unico-2025-luispenafiel-day01-20250612"
  allowed_ip  = "2.206.152.175"
  count       = terraform.workspace == "day01" ? 1 : 0
}

module "day02" {
  source        = "./modules/day02"
  instance_type = "t2.micro"
  ami           = "ami-0c55b159cbfafe1f0"
  count         = terraform.workspace == "day02" ? 1 : 0
}

module "day03" {
  source     = "./modules/day03"
  vpc_cidr   = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
  count      = terraform.workspace == "day03" ? 1 : 0
}

module "day04" {
  source           = "./modules/day04"
  vpc_name         = "my-vpc-day04"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  count            = terraform.workspace == "day04" ? 1 : 0
}

module "day05" {
  source           = "./modules/day05"
  db_instance_class = "db.t2.micro"
  db_engine        = "mysql"
  db_name          = "mydb"
  db_username      = "admin"
  db_password      = "Tontodelculo123_"
  count            = terraform.workspace == "day05" ? 1 : 0
  engine_version   = "5.6.51"  # Añade esta línea
}