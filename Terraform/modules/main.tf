module "vpc" {
  source = "../modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr_block  = var.vpc_cidr_block
}

module "ec2" {
  source = "../modules/ec2"

  vpc_id      = module.vpc.vpc_id
  instance_type = var.instance_type
  key_name    = var.key_name
  count       = var.instance_count
}

module "rds" {
  source = "../modules/rds"

  vpc_id           = module.vpc.vpc_id
  rds_instance_id  = module.ec2.instance_id
  db_name          = var.db_name
  db_username      = var.db_username
  db_password      = var.db_password
}

module "bastion" {
  source = "../modules/bastion"

  vpc_id    = module.vpc.vpc_id
  key_name  = var.key_name
}
