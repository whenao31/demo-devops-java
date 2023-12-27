data "google_project" "project" {
  project_id = var.project_id
}

resource "google_compute_instance" "vm" {
  boot_disk {
    auto_delete = true
    device_name = "${var.instance_name}-disk"

    initialize_params {
      image = var.image_type
      size  = var.disk_size
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = var.machine_type
  name         = var.instance_name

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = var.subnet_name
  }

  scheduling {
    automatic_restart   = false
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "${data.google_project.project.number}-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append", "cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags = var.tags

  metadata_startup_script = var.metadata_file_path != "" ? file(var.metadata_file_path) : null

  zone = var.zone
  project = var.project_id
}