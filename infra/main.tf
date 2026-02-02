
# ----- basic configurations -----
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

# Lokale variabele voor projectnaam, gebruikt in resource namen
locals {
  project_name = "imbalance-forecast"
}

# Random suffix om resource namen uniek te maken
resource "random_id" "suffix" {
  byte_length = 4
}


# ----- IaM config -----

# service accounts
resource "google_service_account" "vertex_sa" {
  account_id   = "vertex-sa"
  display_name = "Vertex AI Service Account"
}

# permissions => (user/admin/viewer)

resource "google_project_iam_member" "vertex_ai" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.vertex_sa.email}"
}

resource "google_project_iam_member" "storage" {
  project = var.project_id
  role    = "roles/storage.objectAdmin"
  member  = "serviceAccount:${google_service_account.vertex_sa.email}"
}

resource "google_project_iam_member" "logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.vertex_sa.email}"
}

resource "google_project_iam_member" "monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.vertex_sa.email}"
}
