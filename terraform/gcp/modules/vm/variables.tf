variable "project_id" {
  type = string
}

variable "image_type" {
  type = string
  default = "projects/debian-cloud/global/images/debian-11-bullseye-v20230912"
}

variable "disk_size" {
  type = string
  default = "10"
  description = "Instance Boot Disk Size in GiB" 
}

variable "machine_type" {
  type = string
  default = "e2-medium"
}

variable "instance_name" {
  type = string
  default = "instance-1"
}

variable "subnet_name" {
  type = string
  default = "projects/sandbox-devops-359615/regions/us-central1/subnetworks/default"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "tags" {
  type = list(string)
}

variable "metadata_file_path" {
  type = string
  default = ""
}