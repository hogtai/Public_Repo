resource "aws_db_instance" "rds_instance" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  identifier           = var.identifier
  name                 = var.name
  username             = var.username
  password             = var.password
  vpc_security_group_ids = [var.security_group_id]

  apply_immediately    = true

  db_subnet_group_name = var.subnet_group_name
  parameter_group_name = var.parameter_group_name

  tags = {
    Name = var.name
  }
}

output "rds_instance_id" {
  value = aws_db_instance.rds_instance.id
}
