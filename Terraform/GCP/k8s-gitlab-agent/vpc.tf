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
  ip_cidr_range = "XX.XXX.XXX.X/XX"
  region        = "us-central1"
  network       = google_compute_network.int_poc_vpc.self_link

  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = "XX.XXX.XXX.X/XX"
  }

  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = "XX.XXX.XXX.XX/XX"
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

resource "google_compute_router" "int_poc_router" {
  name    = "int-poc-router"
  project = var.gcp_project
  region  = var.gcp_region
  network = google_compute_network.int_poc_vpc.self_link
}

resource "google_compute_router_nat" "int_poc_nat" {
  name                                = "int-poc-k8s-gitlabrunner-nat"
  project                             = var.gcp_project
  region                              = var.gcp_region
  router                              = google_compute_router.int_poc_router.name
  nat_ip_allocate_option              = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat  = "LIST_OF_SUBNETWORKS"
  min_ports_per_vm                    = "1024"
  enable_endpoint_independent_mapping = false
  subnetwork {
    name                    = google_compute_subnetwork.int_poc_subnet.name
    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
  }
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
