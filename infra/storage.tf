resource "google_storage_bucket" "model_bucket" {
 name          = "${local.project_name}-models-${random_id.suffix.hex}"
  location      = var.region
  force_destroy = true
}

resource "google_storage_bucket" "vertex_pipeline_bucket" {
  name     = "vertex-pipelines-${var.project_id}"
  location = "EU"
}

resource "google_artifact_registry_repository" "ml_repo" {
  location      = var.region
  repository_id = "ml-repo"
  format        = "DOCKER"
}
