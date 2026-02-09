resource "google_vertex_ai_endpoint" "ml_endpoint" {
  name         = "ml-model-endpoint"
  display_name = "ML Model Endpoint"
  location     = var.region
  
  depends_on = [
    google_project_service.services,
    google_service_account.ml_sa
  ]
}