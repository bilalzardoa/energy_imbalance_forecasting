locals {
  project_name = "if-playground"

  # All IAM configurations in one place
  iam_config = {
    project_roles = [
      "roles/aiplatform.user",
      "roles/logging.logWriter",
      "roles/artifactregistry.reader",
      "roles/run.admin"
    ]
    
    bucket_roles = {
      model_bucket = [
        "roles/storage.objectAdmin"
      ]
      pipeline_bucket = [
        "roles/storage.objectAdmin"
      ]
    }
  }

  # API's to use
  required_services = [
    "aiplatform.googleapis.com",
    "run.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com"
  ]
}