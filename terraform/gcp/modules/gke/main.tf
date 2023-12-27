resource "google_container_cluster" "cluster_apps" {
  project          = var.project_id
  name             = "${var.name}-apps-cluster"
  location         = "us-central1"
  enable_autopilot = true
  network          = var.network_id
  subnetwork       = var.subnet.id

  # remove_default_node_pool = true
  # initial_node_count       = 1

  release_channel {
    channel = "REGULAR"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    # master_ipv4_cidr_block = "172.16.0.32/28" # required when no autopilot
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.subnet.pods_range_name
    services_secondary_range_name = var.subnet.services_range_name
  }

  depends_on = [
    google_project_service.gcp_services
  ]
}

# Separately Managed Node Pool
# resource "google_container_node_pool" "primary_nodes" {
#   name       = "${google_container_cluster.cluster_apps.name}-node-pool"
#   location   = var.zone
#   cluster    = google_container_cluster.cluster_apps.name
#   node_count = var.gke_num_nodes

#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]

#     # preemptible  = true
#     machine_type = var.machine_type
#     tags         = ["gke-node", "${var.project_id}-gke"]
#     metadata = {
#       disable-legacy-endpoints = "true"
#     }
#   }
# }
