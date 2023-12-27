# module "coco_final_cluster" {
#   source = "../modules/gke"

#   project_id = var.project_id
#   network_id = "default"
#   subnet     = module.gke_subnet.subnet
# }

module "devsu_devops_cluster" {
  source = "../modules/gke"

  project_id = var.project_id
  name       = "devsu-devops"
  network_id = "default"
  subnet     = module.gke_subnet.subnet
}

module "sa_secrets" {
  source = "../modules/iam-gke-secrets"

  project_id = var.project_id
  accoun_id  = "k8s-secrets-sa"
  k8s-ns     = "apps"
  k8s-sa     = "k8s-apps-secrets-sa" 
}