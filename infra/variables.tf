# Variabele voor je GCP project ID
variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "environment" {
  type    = string
  description = "Environment: dev, prod, etc."
  default = "dev"
}

variable "model_image_uri" {
  type        = string
  description = "Container image URI voor het trained model"
}

variable "bucket_suffix_length" {
  type    = number
  default = 4
}
