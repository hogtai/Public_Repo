variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "example-security-group" // Name of your security group
}

variable "security_group_description" {
  description = "The description of the security group"
  type        = string
  default     = "Example security group allowing inbound traffic on ports 80 and 443, and outbound traffic on all ports"
}

variable "inbound_port1" {
  description = "The first inbound port to allow"
  type        = number
  default     = 80
}

variable "inbound_port2" {
  description = "The second inbound port to allow"
  type        = number
  default     = 443
}

