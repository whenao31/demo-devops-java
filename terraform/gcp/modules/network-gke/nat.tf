resource "google_compute_router" "cluster_apps" {
  project = var.google_project_id
  name    = "cluster-apps"
  network = var.google_compute_network_id
}

resource "google_compute_router_nat" "cluster_apps" {
  project                             = var.google_project_id
  name                                = "cluster-apps"
  router                              = google_compute_router.cluster_apps.name
  region                              = google_compute_router.cluster_apps.region
  nat_ip_allocate_option              = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  enable_endpoint_independent_mapping = false
  min_ports_per_vm                    = 64

  log_config {
    enable = false
    filter = "ALL"
  }
}