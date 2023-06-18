output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = aws_db_instance.default.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.default.arn
}

output "rds_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.default.arn
}


