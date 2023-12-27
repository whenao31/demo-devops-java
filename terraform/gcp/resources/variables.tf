variable "target_tags" {
  type    = list(string)
  default = ["jenkins-srv"]
}

variable "project_id" {
  type    = string
  default = "storied-cider-400415"
}

variable "region" {
  default = "us-central1"
}