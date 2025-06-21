module "network_adventure" {
  source          = "../network"
  vpc_name        = "adventure-park-vpc"
  vpc_cidr        = "10.1.0.0/16"
  public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
  private_subnets = ["10.1.3.0/24", "10.1.4.0/24"]
}

output "adventure_vpc_id" {
  value = module.network_adventure.vpc_id
}

output "adventure_public_subnet_ids" {
  value = module.network_adventure.public_subnet_ids
}

output "adventure_private_subnet_ids" {
  value = module.network_adventure.private_subnet_ids
}
