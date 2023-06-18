variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "My VPC" # Replace with your desired VPC name
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "" # Replace with your desired CIDR block
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "" # Replace with your desired subnet CIDR block
}

variable "subnet_availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-2a" # Replace with your desired default availability zone
  # NOTE: Subnets can currently only be created in the following 
  # availability zones: us-east-2a, us-east-2b, us-east-2c
}