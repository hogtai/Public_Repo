provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"
  vpc_cidr_block = var.vpc_cidr
  vpc_name       = var.vpc_name
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.3.1"
  subnet_id      = var.vpc.subnet_id
  instance_count = var.instance_count
  instance_type  = var.instance_type
  ami            = var.ami
  key_name       = var.key_name
  name_prefix    = var.name_prefix
}

module "rds" {
  source               = "terraform-aws-modules/rds/aws"
  version              = "6.1.1"
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.db_instance_class
  identifier           = var.identifier
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  security_group_id    = module.vpc.default_security_group_id
  subnet_group_name    = var.db_subnet_group_name
  parameter_group_name = var.db_parameter_group_name
}

module "bastion" {
  source            = "./modules/bastion"
  key_name          = var.key_name
  security_group_id = var.vpc.default_security_group_id
  ami_id            = var.bastion_ami_id
  instance_type     = var.bastion_instance_type
}
