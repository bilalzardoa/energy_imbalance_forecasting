variable "project_id" {
  description = "GCP project id"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west1"
}

variable "environment" {
  description = "Environment (dev/prod/etc)"
  type        = string
  default     = "dev"
}

variable "bucket_suffix_length" {
  description = "Length of random suffix for buckets"
  type        = number
  default     = 4
}
