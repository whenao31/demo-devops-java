variable "project_id" {
  type = string
}

variable "name" {
  type = string
  default = "final-lab"
}

variable "network_id" {
  type = string
}

variable "subnet" {
  type = object({
    id                  = string,
    pods_range_name     = string,
    services_range_name = string
  })
}

# Variable containing all the necessary services to be enabled
variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com"
  ]
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "machine_type" {
  description = "instance type available in the region"
  default = "e2-medium"
}

variable "zone" {
  default = "us-central1-a"
}
