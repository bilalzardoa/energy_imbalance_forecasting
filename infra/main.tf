# random provider is nodig voor random_id suffix te doen etc
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.34"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

# Provider block: verbindt Terraform met jouw GCP project en regio
provider "google" {
  project = var.project_id
  region  = "europe-west1"
}

# Variabele voor je GCP project ID
variable "project_id" {
  type = string
}

# Lokale variabele voor projectnaam, gebruikt in resource namen
locals {
  project_name = "imbalance-forecast"
}

# Random suffix om resource namen uniek te maken
resource "random_id" "suffix" {
  byte_length = 4
}
