provider "aws" {
  region = var.region
}

module "vpc" {
  source                   = "./modules/vpc"
  vpc_cidr_block           = var.vpc_cidr_block
  vpc_name                 = var.vpc_name
  subnet_cidr              = var.subnet_cidr
  subnet_availability_zone = var.subnet_availability_zone
  depends_on               = [module.vpc_security_group]
}

module "vpc_security_group" {
  source                     = "./modules/securitygroups"
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  inbound_port1              = var.inbound_port1
  inbound_port2              = var.inbound_port2
}

module "wpserver_security_group" {
  source                     = "./modules/securitygroups/privateSG"
  security_group_name        = var.wpserver_security_group_name
  security_group_description = var.wpserver_security_group_description
  inbound_port1              = var.wpserver_inbound_port1
  inbound_port2              = var.wpserver_inbound_port2
}

module "postgres_security_group" {
  source                     = "./modules/securitygroups/postgresSG"
  security_group_name        = var.postgres_security_group_name
  security_group_description = var.postgres_security_group_description
  inbound_port1              = var.postgres_inbound_port1
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
  source                = "./modules/ec2"
  region                = var.region
  bastion_instance_name = var.bastion_instance_name
  windows_ami           = var.windows_ami
  bastion_instance_type = var.bastion_instance_type
  key_pair_name         = var.key_pair_name
  public_subnet         = module.public_subnets.public_subnet_ids[0]
  security_group_id     = [module.vpc_security_group]
  bastion_volume_size   = var.bastion_volume_size
}

module "wpserver1" {
  source                = "./modules/ec2"
  region                = var.region
  bastion_instance_name = var.wpserver1_instance_name
  windows_ami           = var.redhat_ami
  bastion_instance_type = var.wpserver_instance_type
  key_pair_name         = var.key_pair_name
  public_subnet         = module.wp_subnets.wp_subnet_ids[0]
  security_group_id     = [module.wpserver_security_group]
  bastion_volume_size   = var.wpserver_volume_size
}

module "wpserver2" {
  source                = "./modules/ec2"
  region                = var.region
  bastion_instance_name = var.wpserver2_instance_name
  windows_ami           = var.redhat_ami
  bastion_instance_type = var.wpserver_instance_type
  key_pair_name         = var.key_pair_name
  public_subnet         = module.wp_subnets.wp_subnet_ids[1]
  security_group_id     = [module.wpserver_security_group]
  bastion_volume_size   = var.wpserver_volume_size
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
