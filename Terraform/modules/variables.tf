variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"      # Replace with your desired default value
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16" # Replace with your desired default value
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24" # Replace with your desired default value
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"    # Replace with your desired default value
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-12345678"   # Replace with your desired default value
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "my-keypair"   # Replace with your desired default value
}

variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "my-app"       # Replace with your desired default value
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t2.micro"  # Replace with your desired default value
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "my-database"  # Replace with your desired default value
}

variable "db_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "admin"        # Replace with your desired default value
}

variable "db_password" {
  description = "Password for the RDS database"
  type        = string
  default     = "password123"  # Replace with your desired default value
}

variable "bastion_ami_id" {
  description = "AMI ID for the bastion host"
  type        = string
  default     = "ami-98765432"   # Replace with your desired default value
}

variable "bastion_instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"    # Replace with your desired default value
}
