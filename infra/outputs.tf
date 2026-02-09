output "artifact_registry_url" {
  description = "Artifact Registry URL for Docker images"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.ml_repo.repository_id}"
}

output "model_bucket_name" {
  description = "Cloud Storage bucket for models"
  value       = google_storage_bucket.model_bucket.name
}

output "pipeline_bucket_name" {
  description = "Cloud Storage bucket for Vertex AI pipelines"
  value       = google_storage_bucket.vertex_pipeline_bucket.name
}

output "vertex_endpoint_id" {
  description = "Vertex AI Endpoint ID"
  value       = google_vertex_ai_endpoint.ml_endpoint.id
}

output "vertex_endpoint_name" {
  description = "Vertex AI Endpoint name"
  value       = google_vertex_ai_endpoint.ml_endpoint.name
}

output "service_account_email" {
  description = "ML Service Account email"
  value       = google_service_account.ml_sa.email
}