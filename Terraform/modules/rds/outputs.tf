output "rds_instance_id" {
  description = "ID of the created RDS instance"
  value       = aws_db_instance.rds_instance.id
}
