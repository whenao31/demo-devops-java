resource "google_service_account" "default" {
  account_id   = var.accoun_id
  project      = var.project_id
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/secretmanager.viewer"
  
  members = [
    google_service_account.default.member,
  ]
}

resource "google_service_account_iam_binding" "service-account-iam" {
  service_account_id = google_service_account.default.id
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${var.project_id}.svc.id.goog[${var.k8s-ns}/${var.k8s-sa}]",
  ]
}