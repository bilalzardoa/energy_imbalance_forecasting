resource "random_id" "suffix" {
  byte_length = var.bucket_suffix_length
}

resource "google_project_service" "services" {
  for_each = toset(local.required_services)
  service = each.value
}
