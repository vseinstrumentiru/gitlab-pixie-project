variable "config_path" {
  type = string
}
variable "config_context" {
  type = string
}
variable "pixie_operator_ns" {
  type = string
}
variable "deploy_key" {
  type = string
}
variable "vizier_version" {
  type = string
}
variable "disable_auto_update" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "cloud_address" {
  type = string
}
variable "vizier_pem_tolerations" {
  type = list(object({
    effect = string
    key    = string
    value  = string
  }))
}
variable "vizier_pem_node_selector" {
  type = object({
    label = string
    value = string
  })
}