variable "region" {
  description = "The AWS region where resources should be created"
  default     = "us-east-2" // Change as per your AWS region
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "vpc_name" {
  description = "The name to be used for the VPC"
  default     = "Application Plan VPC" // Change as per your preference
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "my-security-group"
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Security group for allowing inbound traffic on ports 80 & 443"
}

variable "inbound_port1" {
  description = "The first inbound port to allow traffic on"
  type        = number
  default     = 80
}

variable "inbound_port2" {
  description = "The second inbound port to allow traffic on"
  type        = number
  default     = 443
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "wp_subnet_cidrs" {
  description = "CIDR blocks for the WP subnets"
  type        = list(string)
  default     = ["10.1.2.0/24", "10.1.3.0/24"]
}

variable "db_subnet_cidrs" {
  description = "CIDR blocks for the DB subnets"
  type        = list(string)
  default     = ["10.1.4.0/24", "10.1.5.0/24"]
}

variable "windows_ami" {
  description = "The ID of the AMI to use for the Windows instance"
  default     = "ami-0d94c3e6631d82048" // Fill in with your AMI ID
}

variable "redhat_ami" {
  description = "The ID of the AMI to use for the Red Hat instances"
  default     = "ami-02b8534ff4b424939" // Fill in with your AMI ID
}

variable "bastion_instance_type" {
  description = "The instance type for the bastion instance"
  default     = "t3a.medium"
}

variable "bastion_instance_name" {
  description = "The instance name for the bastion instance"
  default     = "bastion1"
}

variable "bastion_volume_size" {
  description = "The volume size for the bastion instance"
  default     = 50
}

variable "key_pair_name" {
  description = "The name of the key pair to be used for the instance"
  type        = string
  default     = "coalfire" // replace with your key pair name
}

variable "wpserver_instance_type" {
  description = "The instance type for the wpserver instances"
  default     = "t3a.micro"
}

variable "wpserver1_instance_name" {
  description = "The instance name for the wpserver1 instance"
  default     = "wpserver1"
}

variable "wpserver2_instance_name" {
  description = "The instance name for the wpserver2 instance"
  default     = "wpserver2"
}

variable "wpserver_volume_size" {
  description = "The volume size for the wpserver instances"
  default     = 20
}

variable "rds_instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name for the RDS database"
  default     = "rds1"
}

variable "db_engine" {
  description = "The engine for the RDS database"
  default     = "postgres"
}

variable "db_engine_version" {
  description = "The engine version for the RDS database"
  default     = "11.16" // Fill in with your version
}

variable "db_username" {
  description = "The username for the RDS database"
  default     = "Administrator" // Fill in with your username
  sensitive   = true
}

variable "db_password" {
  description = "The password for the RDS database"
  default     = "12345678" // Fill in with your password
  sensitive   = true
}

variable "alb_listener_port" {
  description = "The port that the ALB should listen on"
  default     = 443
}

variable "availability_zones" {
  description = "List of Availability Zones where the subnets will be created"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"] // Replace with your desired availability zones
}

variable "db_subnet_names" {
  description = "List of names for the database subnets"
  type        = list(string)
  default     = ["db-subnet-1", "db-subnet-2"] // Replace with your desired subnet names
}

variable "wp_subnet_names" {
  description = "Names of the WP subnets"
  type        = list(string)
  default     = ["wp-subnet-1", "wp-subnet-2"] // Replace with your desired subnet names
}

variable "wp_subnet_availability_zones" {
  description = "Availability Zones for the WP subnets"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"] // Replace with your desired availability zones
}

variable "subnet_cidr" {
  description = "CIDR block for the subnets"
  type        = string
  default     = "10.1.6.0/24" // Replace with your desired CIDR block for the subnets
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
  default     = "us-east-2a" // Replace with your desired availability zone
}

variable "alb_security_group" {
  description = "The ID of the security group to attach to the ALB"
  type        = string
  default     = "sg-0123456789abcdef0" // Replace with your desired security group ID
}

variable "public_subnet_names" {
  description = "List of names for the public subnets"
  type        = list(string)
  default     = ["public-subnet-1", "public-subnet-2"] // Replace with your desired subnet names
}

variable "subnet_ids" {
  description = "List of VPC Subnet IDs where the RDS instance is to be created"
  type        = list(string)
  default     = ["subnet-1", "subnet-2"] # Replace with your subnet IDs
}

variable "wpserver_security_group_name" {
  description = "The name of the WP server security group"
  type        = string
  default     = "wpserver-security-group"
}

variable "wpserver_security_group_description" {
  description = "The description of the WP server security group"
  type        = string
  default     = "Security group for WP servers"
}

variable "wpserver_inbound_port1" {
  description = "The first inbound port to allow traffic on for WP servers"
  type        = number
  default     = 80
}

variable "wpserver_inbound_port2" {
  description = "The second inbound port to allow traffic on for WP servers"
  type        = number
  default     = 443
}

variable "wpserver_outbound_port" {
  description = "The outbound port to allow traffic to anywhere for WP servers"
  type        = number
  default     = 5432
}

variable "postgres_security_group_name" {
  description = "The name of the PostgreSQL security group"
  type        = string
  default     = "my-postgres-security-group"
}

variable "postgres_security_group_description" {
  description = "The description of the PostgreSQL security group"
  type        = string
  default     = "Security group for PostgreSQL"
}

variable "postgres_inbound_port1" {
  description = "The inbound port for PostgreSQL"
  type        = number
  default     = 5432
}
