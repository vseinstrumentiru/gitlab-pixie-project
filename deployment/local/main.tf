terraform {
  backend "local" {
  }
}

module "main-local" {
  source                   = "../../modules/main"
  config_path              = var.config_path
  config_context           = "minikube"
  pixie_operator_ns        = "pixie"
  cloud_address            = var.cloud_address
  cluster_name             = var.cluster_name
  deploy_key               = var.deploy_key
  vizier_version           = var.vizier_version
  disable_auto_update      = var.disable_auto_update
  vizier_pem_tolerations   = var.vizier_pem_tolerations
  vizier_pem_node_selector = var.vizier_pem_node_selector
}
