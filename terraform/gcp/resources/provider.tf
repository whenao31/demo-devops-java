# Specify the provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Terraform config
terraform {
  backend "gcs" {
    bucket = "coco-lab-final"
    prefix = "terraform/state"
  }
}

