output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.public_subnets.public_subnet_ids
}

output "wp_subnet_ids" {
  description = "The IDs of the web application subnets"
  value       = module.wp_subnets.wp_subnet_ids
}

output "db_subnet_ids" {
  description = "The IDs of the DB subnets"
  value       = module.db_subnets.db_subnet_ids
}

output "bastion_instance_id" {
  description = "The ID of the Bastion instance"
  value       = module.bastion.instance_id
}

output "wpserver1_instance_id" {
  description = "The ID of the first web application server instance"
  value       = module.wpserver1.instance_id
}

output "wpserver2_instance_id" {
  description = "The ID of the second web application server instance"
  value       = module.wpserver2.instance_id
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = module.alb.alb_arn
}