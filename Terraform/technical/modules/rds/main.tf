resource "aws_db_subnet_group" "default" {
  name       = "${var.db_name}_subnet_group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.db_name}_subnet_group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  identifier           = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres11"
  publicly_accessible  = false
  db_subnet_group_name = aws_db_subnet_group.default.name // Use the subnet group here

  tags = {
    Name = var.db_name
  }
}


