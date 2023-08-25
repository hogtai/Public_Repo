module "network" {
  source        = "terraform-google-modules/network/google"
  version       = "7.3.0"
  network_name  = var.network_name
  project_id    = var.project_id

# Optional Values

  auto_create_subnetworks                 = var.auto_create_subnetworks
  delete_default_internet_gateway_routes  = var.delete_default_internet_gateway_routes
  description                             = var.description
  egress_rules                            = var.egress_rules
  ingress_rules                           = var.ingress_rules
  mtu                                     = var.mtu
  routes                                  = var.routes
  routing_mode                            = var.routing_mode
  secondary_ranges                        = var.secondary_ranges
  shared_vpc_host                         = var.shared_vpc_host

}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "default-vpc"
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "my-gcp-project"
}

variable "auto_create_subnetworks" {
  description = "Whether to auto-create subnetworks"
  type        = bool
  default     = true
}

variable "delete_default_internet_gateway_routes" {
  description = "Whether to delete default internet gateway routes"
  type        = bool
  default     = false
}

variable "description" {
  description = "Description of the VPC network"
  type        = string
  default     = "My custom VPC network"
}

variable "egress_rules" {
  description = "Egress rules for the VPC network"
  type        = list(any)
  default     = []
}

variable "ingress_rules" {
  description = "Ingress rules for the VPC network"
  type        = list(any)
  default     = []
}

variable "mtu" {
  description = "The Maximum Transmission Unit (MTU) for the VPC network"
  type        = string
  default     = "1460"
}

variable "routes" {
  description = "Custom routes for the VPC network"
  type        = list(any)
  default     = []
}

variable "routing_mode" {
  description = "The network-wide routing mode to use; either 'REGIONAL' or 'GLOBAL'"
  type        = string
  default     = "GLOBAL"
}

variable "secondary_ranges" {
  description = "Secondary IP ranges for the VPC network"
  type        = list(any)
  default     = []
}

variable "shared_vpc_host" {
  description = "Whether this VPC network is a shared VPC host"
  type        = bool
  default     = false
}

