variable "allocated_storage" {
  description = "Allocated storage in gigabytes"
  type        = number
  default     = 100 # Replace with your desired default value
}

variable "engine" {
  description = "Database engine type"
  type        = string
  default     = "mysql" # Replace with your desired default value
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0" # Replace with your desired default value
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
  default     = "db.t3.micro" # Replace with your desired default value
}

variable "identifier" {
  description = "Identifier for the RDS instance"
  type        = string
  default     = "my-rds-instance" # Replace with your desired default value
}

variable "db_name" {
  description = "Name for the RDS instance"
  type        = string
  default     = "mydatabase84134" # Replace with your desired default value
}                                 # must begin with a letter and contain only alphanumeric characters.

variable "username" {
  description = "Username for the database"
  type        = string
  default     = "admin" # Replace with your desired default value
}

variable "password" {
  description = "Password for the database"
  type        = string
  default     = "password123" # Replace with your desired default value
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
  default     = "sg-12345678" # Replace with your desired default value
}

variable "subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
  default     = "my-db-subnet-group" # Replace with your desired default value
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
  default     = "my-db-parameter-group" # Replace with your desired default value
}

variable "parameter_group_family" {
  description = "DB parameter group family"
  type        = string
  default     = "mysql8.0" # Replace with the appropriate DB parameter group family
}

variable "parameter_group_description" {
  description = "Description of the DB parameter group"
  type        = string
  default     = "My RDS Parameter Group" # Replace with your desired default value
}

variable "parameter_name1" {
  description = "Name of the first parameter"
  type        = string
  default     = "innodb_buffer_pool_size" # Replace with the actual parameter name
}

variable "parameter_value1" {
  description = "Value of the first parameter"
  type        = string
  default     = "500" # Replace with the actual parameter value
}

variable "parameter_name2" {
  description = "Name of the second parameter"
  type        = string
  default     = "max_connections" # Replace with the actual parameter name
}

variable "parameter_value2" {
  description = "Value of the second parameter"
  type        = string
  default     = "500" # Replace with the actual parameter value
}

variable "subnet_id1" {
  description = "ID of subnet 1"
  type        = string
  default     = "subnet-12345678" # Replace with the default subnet ID for subnet 1
}

variable "subnet_id2" {
  description = "ID of the second subnet"
  type        = string
  default     = "subnet-87654321" # Replace with the default subnet ID for subnet 2
}

variable "subnet1_cidr_block" {
  description = "CIDR block for subnet 1"
  type        = string
  default     = "10.0.1.0/24" # Replace with the appropriate CIDR block for subnet 1
}

variable "subnet1_availability_zone" {
  description = "Availability zone for subnet 1"
  type        = string
  default     = "us-east-2a" # Replace with the appropriate availability zone for subnet 1
}

variable "subnet2_cidr_block" {
  description = "CIDR block for subnet 2"
  type        = string
  default     = "10.0.2.0/24" # Replace with the appropriate CIDR block for subnet 2
}

variable "subnet2_availability_zone" {
  description = "Availability zone for subnet 2"
  type        = string
  default     = "us-east-2b" # Replace with the appropriate availability zone for subnet 2
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "My VPC" # Replace with your desired VPC name
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # Replace with your desired CIDR block
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24" # Replace with your desired subnet CIDR block
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-2a" # Replace with your desired default availability zone
  # NOTE: Subnets can currently only be created in the following 
  # availability zones: us-east-2a, us-east-2b, us-east-2c
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-12345678"] # Replace with your desired default value
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "rds-security-group" # Replace with your desired default value
}

variable "allowed_cidr_block" {
  description = "CIDR block to allow access to the RDS instance"
  type        = string
  default     = "0.0.0.0/0" # Replace with your desired default value
}

variable "name" {
  description = "Name for the RDS instance"
  type        = string
  default     = "my-rds-instance" # Replace with your desired default value
}

