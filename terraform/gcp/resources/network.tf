resource "google_compute_firewall" "ssh_rule" {
  name = "ssh-fw-rule"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}
# [END vpc_jenkins_quickstart_ssh_fw]


# [START vpc_jenkins_quickstart_8080_fw]
resource "google_compute_firewall" "jenkins_rule" {
  name = "jenkins-fw-rule"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  network       = "default"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}

module "gke_subnet" {
  source                    = "../modules/network-gke"
  google_project_id         = var.project_id
  google_compute_network_id = "default"
  cluster_name              = "final-lab"
}