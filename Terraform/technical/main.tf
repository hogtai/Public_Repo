provider "aws" {
  region = var.region
}

module "vpc" {
  source                   = "./modules/vpc"
  vpc_cidr_block           = var.vpc_cidr_block
  vpc_name                 = var.vpc_name
  subnet_cidr              = var.subnet_cidr
  subnet_availability_zone = var.subnet_availability_zone
}

module "public_subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  subnet_cidrs       = var.public_subnet_cidrs
  availability_zones = var.availability_zones
  subnet_names       = var.public_subnet_names
}

module "wp_subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  subnet_names       = var.wp_subnet_names
  subnet_cidrs       = var.wp_subnet_cidrs
  availability_zones = var.availability_zones
}

module "db_subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  subnet_cidrs       = var.db_subnet_cidrs
  availability_zones = var.availability_zones
  subnet_names       = var.db_subnet_names
}

module "bastion" {
  source        = "./modules/ec2"
  ami           = var.windows_ami
  subnet_id     = module.public_subnets.public_subnet_ids[0]
  instance_type = var.bastion_instance_type
  instance_name = var.bastion_instance_name
  volume_size   = var.bastion_volume_size
}

module "wpserver1" {
  source        = "./modules/ec2"
  ami           = var.redhat_ami
  subnet_id     = module.wp_subnets.wp_subnet_ids[0]
  instance_type = var.wpserver_instance_type
  instance_name = var.wpserver1_instance_name
  volume_size   = var.wpserver_volume_size
}

module "wpserver2" {
  source        = "./modules/ec2"
  ami           = var.redhat_ami
  subnet_id     = module.wp_subnets.wp_subnet_ids[1]
  instance_type = var.wpserver_instance_type
  instance_name = var.wpserver2_instance_name
  volume_size   = var.wpserver_volume_size
}

module "rds" {
  source = "./modules/rds"
  subnet_ids = [
    module.db_subnets.db_subnet_ids[0],
    module.db_subnets.db_subnet_ids[1]
  ]
  db_instance_class = var.rds_instance_class
  db_name           = var.db_name
  db_engine         = var.db_engine
  db_engine_version = var.db_engine_version
  db_username       = var.db_username
  db_password       = var.db_password
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.public_subnets.public_subnet_ids
  security_group = var.alb_security_group
  listener_port  = var.alb_listener_port
}
