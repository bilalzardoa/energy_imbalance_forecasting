locals {
  project_name = "if-playground"

  # IAM configurations
  iam_config = {
    project_roles = [
      "roles/aiplatform.user",           # Vertex AI access
      "roles/logging.logWriter",         # Logging
      "roles/artifactregistry.reader"    # Pull Docker images
    ]
    
    bucket_roles = {
      model_bucket = [
        "roles/storage.objectAdmin"      # Read/write models
      ]
      pipeline_bucket = [
        "roles/storage.objectAdmin"      # Pipeline artifacts
      ]
    }
  }

  # Required APIs
  required_services = [
    "aiplatform.googleapis.com",         # Vertex AI
    "artifactregistry.googleapis.com",   # Docker images
    "cloudbuild.googleapis.com",         # Build images
    "iam.googleapis.com",                # IAM management
    "storage.googleapis.com"             # Cloud Storage (optioneel, vaak al enabled)
  ]
}