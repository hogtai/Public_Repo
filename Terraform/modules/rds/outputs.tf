output "rds_endpoint" {
  value       = aws_db_instance.rds.endpoint
  description = "Endpoint of the RDS DB instance"
}

output "rds_security_group_id" {
  value       = tolist(aws_db_instance.rds.vpc_security_group_ids)[0]
  description = "Security Group ID of the RDS DB instance"
}

output "rds_instance_id" {
  value       = aws_db_instance.rds.id
  description = "ID of the RDS DB instance"
}

output "rds_subnet_group_name" {
  value       = aws_db_subnet_group.db_subnet_group.name
  description = "Name of the RDS DB subnet group"
}

output "subnet_id1" {
  value = aws_subnet.subnet1.id
}

output "subnet_id2" {
  value = aws_subnet.subnet2.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

output "subnet_id" {
  value = aws_subnet.subnet1.id
}

output "rds_security_group_ids" {
  value = aws_db_instance.rds.vpc_security_group_ids
}

output "db_parameter_group_name" {
  value = aws_db_parameter_group.rds_parameter_group.name
}