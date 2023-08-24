resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.region
  storage_class = var.class

  labels = {
    var.key = var.value
  }

  uniform_bucket_level_access = true

  bucket_policy_only = true
}
