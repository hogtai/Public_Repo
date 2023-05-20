output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "ec2_instance_ids" {
  value = module.ec2.instance_ids
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}