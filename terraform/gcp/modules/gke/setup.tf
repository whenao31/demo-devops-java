# Enable services
resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)

  project = var.project_id
  service = each.key

  timeouts {
    create = "500m"
    update = "40m"
  }

  disable_dependent_services = true

  #disables the service when the terraform resource is destroyed
  disable_on_destroy = true
}
