locals {
  project_name = "if-playground"

  vertex_roles = [
    "roles/aiplatform.user",
    "roles/storage.objectAdmin",
    "roles/logging.logWriter"
  ]

  required_services = [
    "aiplatform.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com"
  ]
}
