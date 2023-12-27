output "subnet" {
  value = {
    id = google_compute_subnetwork.lab_subnet.id,
    pods_range_name     = google_compute_subnetwork.lab_subnet.secondary_ip_range.0.range_name,
    services_range_name = google_compute_subnetwork.lab_subnet.secondary_ip_range.1.range_name
  }
}