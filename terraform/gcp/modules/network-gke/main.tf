resource "google_compute_subnetwork" "lab_subnet" {
  project                  = var.google_project_id
  name                     = "${var.cluster_name}-subnet"
  ip_cidr_range            = cidrsubnet("10.100.0.0/9", 15, 0 * 36)
  private_ip_google_access = true
  network                  = var.google_compute_network_id
  secondary_ip_range {
    range_name    = "${var.cluster_name}-pods"
    ip_cidr_range = cidrsubnet("10.100.0.0/9", 11, (0 * 2) + 1)
  }
  secondary_ip_range {
    range_name    = "${var.cluster_name}-services"
    ip_cidr_range = cidrsubnet("10.100.0.0/9", 13, (0 + 1) * 8)
  }
}