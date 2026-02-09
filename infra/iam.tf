# Single service account for everything
resource "google_service_account" "ml_sa" {
  account_id   = "ml-service-account"
  display_name = "ML Service Account for Vertex AI and Cloud Run"
  
  depends_on = [google_project_service.services]
}

# Project roles
resource "google_project_iam_member" "ml_project_roles" {
  for_each = toset(local.iam_config.project_roles)
  
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.ml_sa.email}"
}

# Bucket roles
resource "google_storage_bucket_iam_member" "model_bucket_access" {
  for_each = toset(local.iam_config.bucket_roles.model_bucket)
  
  bucket = google_storage_bucket.model_bucket.name
  role   = each.value
  member = "serviceAccount:${google_service_account.ml_sa.email}"
}

resource "google_storage_bucket_iam_member" "pipeline_bucket_access" {
  for_each = toset(local.iam_config.bucket_roles.pipeline_bucket)
  
  bucket = google_storage_bucket.vertex_pipeline_bucket.name
  role   = each.value
  member = "serviceAccount:${google_service_account.ml_sa.email}"
}
