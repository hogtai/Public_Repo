terraform {
  required_version = ">= 1.5.6"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.79.0"
    }
  }
}
