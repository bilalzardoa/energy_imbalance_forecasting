resource "google_service_account" "vertex_sa" {
  account_id   = "vertex-sa"
  display_name = "Vertex AI Service Account"
}

resource "google_service_account" "run_sa" {
  account_id   = "run-sa"
  display_name = "Cloud Run Service Account"
}

resource "google_project_iam_member" "vertex_roles" {

  project = var.project_id
  for_each = toset(local.vertex_roles)

  role   = each.value
  member = "serviceAccount:${google_service_account.vertex_sa.email}"

}

