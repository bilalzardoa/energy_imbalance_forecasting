resource "google_storage_bucket" "model_bucket" {
 name          = "${local.project_name}-models-${random_id.suffix.hex}"
  location      = var.region
  # force_destroy = true

  depends_on = [google_project_service.services]

}

resource "google_storage_bucket" "vertex_pipeline_bucket" {
  name          = "vertex-pipelines-${var.project_id}"
  location      = "EU"
  # force_destroy = true
  
  depends_on = [google_project_service.services]
}


resource "google_artifact_registry_repository" "ml_repo" {
  location      = var.region
  repository_id = "ml-repo"
  format        = "DOCKER"

  depends_on = [google_project_service.services]

}