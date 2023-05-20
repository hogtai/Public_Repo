provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr
  vpc_name       = var.vpc_name
}

module "ec2" {
  source         = "./modules/ec2"
  subnet_id      = module.vpc.subnet_id
  instance_count = var.instance_count
  instance_type  = var.instance_type
  ami            = var.ami
  key_name       = var.key_name
  name_prefix    = var.name_prefix
}

module "rds" {
  source              = "./modules/rds"
  subnet_ids          = module.vpc.subnet_ids
  db_instance_class   = var.db_instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
}

module "bastion" {
  source              = "./modules/bastion"
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.vpc.public_subnet_id
  key_name            = var.key_name
  security_group_id   = module.vpc.default_security_group_id
  ami_id              = var.bastion_ami_id
  instance_type       = var.bastion_instance_type
}