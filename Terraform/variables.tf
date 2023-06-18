variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "vpc" {
  description = "VPC module input variable"
  type = object({
    subnet_id = string
  })
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for subnets"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "db_instance_class" {
  description = "RDS database instance class"
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "RDS database name"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "RDS database username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS database password"
  type        = string
  default     = "password123"
}

variable "allocated_storage" {
  description = "Allocated storage in gigabytes"
  type        = number
}

variable "engine" {
  description = "Database engine type"
  type        = string
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
}

variable "identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
}