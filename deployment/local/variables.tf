variable "config_path" {
  type    = string
  default = "~/.kube/config"
}
variable "pixie_operator_ns" {
  type    = string
  default = "pixie"
}
variable "vizier_version" {
  type    = string
  default = "0.11.1"
}
variable "disable_auto_update" {
  type    = string
  default = "true"
}
variable "deploy_key" {
  type    = string
  default = ""
}
variable "cloud_address" {
  type    = string
  default = ""
}
variable "cluster_name" {
  type    = string
  default = ""
}
variable "vizier_pem_tolerations" {
  type = list(object({
    effect = string
    key    = string
    value  = string
  }))
  default = [
    {
      effect = "NoExecute"
      key    = "dedicated"
      value  = "searches"
    }
  ]
}
variable "vizier_pem_node_selector" {
  type = object({
    label = string
    value = string
  })
  default = {
    label = "dedicated"
    value = "searches"
  }
}
