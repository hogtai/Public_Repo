resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-rt"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet1_cidr_block
  availability_zone = var.subnet1_availability_zone

  tags = {
    Name = "Subnet 1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet2_cidr_block
  availability_zone = var.subnet2_availability_zone

  tags = {
    Name = "Subnet 2"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.subnet_group_name
  description = "My DB subnet group"
  subnet_ids  = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = var.subnet_group_name
  }
}

resource "aws_security_group" "rds_sg" {
  name        = var.security_group_name
  description = "RDS Security Group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.allowed_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.identifier
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  apply_immediately = true

  parameter_group_name = var.parameter_group_name

  tags = {
    Name = var.name
  }
}

resource "aws_db_parameter_group" "rds_parameter_group" {
  name        = var.parameter_group_name
  family      = var.parameter_group_family
  description = var.parameter_group_description

  // Specify parameters for the parameter group
  parameter {
    name  = var.parameter_name1
    value = var.parameter_value1
  }

  parameter {
    name  = var.parameter_name2
    value = var.parameter_value2
  }
}
