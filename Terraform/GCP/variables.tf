variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
  default     = "my-default-bucket-name"
}

variable "key" {
  description = "The key for the label"
  type        = string
  default     = "environment"
}

variable "value" {
  description = "The value for the label"
  type        = string
  default     = "development"
}

variable "region" {
  description = "The region where the bucket will be created"
  type        = string
  default     = "us-central1"
}

variable "class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD"
}
