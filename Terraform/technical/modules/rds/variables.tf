variable "subnet_ids" {
  description = "List of VPC Subnet IDs where the RDS instance is to be created"
  type        = list(string)
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
}

variable "db_name" {
  description = "The name of the RDS instance"
}

variable "db_engine" {
  description = "The database engine to use"
}

variable "db_engine_version" {
  description = "The engine version to use"
}

variable "db_username" {
  description = "Username for the master DB user"
}

variable "db_password" {
  description = "Password for the master DB user"
  sensitive   = true
}

