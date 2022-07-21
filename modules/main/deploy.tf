module "pixie-operator" {
  source = "../../modules/pixie-operator"

  pixie_operator_ns        = var.pixie_operator_ns
  cloud_address            = var.cloud_address
  cluster_name             = var.cluster_name
  deploy_key               = var.deploy_key
  vizier_version           = var.vizier_version
  disable_auto_update      = var.disable_auto_update
  vizier_pem_tolerations   = var.vizier_pem_tolerations
  vizier_pem_node_selector = var.vizier_pem_node_selector
}
