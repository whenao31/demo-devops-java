# module "jenkins_server" {
#   source = "../modules/vm"

#   project_id         = var.project_id
#   instance_name      = "jenkins-srv"
#   subnet_name        = "projects/${var.project_id}/regions/us-central1/subnetworks/default"
#   tags               = var.target_tags
#   metadata_file_path = "./jenkins_server_startup_commands.txt"
# }