output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}

output "rds_security_group_id" {
  value = aws_db_instance.rds.vpc_security_group_ids[0]
}
