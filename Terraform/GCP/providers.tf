provider "google" {
  credentials = file("<PATH_TO_YOUR_SERVICE_ACCOUNT_KEY_JSON>")
  project     = "<YOUR_PROJECT_ID>"
  region      = "var.region"
}
