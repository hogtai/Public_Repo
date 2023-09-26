provider "google" {
  project = "157931075527"
  region  = "us-central1"
}

resource "google_compute_network" "int_poc_vpc" {
  name                    = "int-poc-k8s-gitlab-runner"
  description             = "VPC for testing gitlab kubernetes runner agent"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
  mtu                     = 1460
}

resource "google_compute_subnetwork" "int_poc_subnet" {
  name          = "int-poc-k8s-gitlab-runner-subnet-01"
  description   = ""
  ip_cidr_range = "10.250.108.0/28"
  region        = "us-central1"
  network       = google_compute_network.int_poc_vpc.self_link

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "10.250.112.0/20"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "10.250.108.64/26"
  }

  private_ip_google_access = true
}

resource "google_compute_global_address" "int_poc_vpc_ula" {
  name          = "int-poc-vpc-ula"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  ip_version    = "IPV4"
  prefix_length = 24
  network       = google_compute_network.int_poc_vpc.self_link
}
