resource "helm_release" "pixie_operator" {
  name              = "pixie-operator"
  chart             = "${path.module}/chart"
  namespace         = var.pixie_operator_ns
  dependency_update = true
  create_namespace  = true
  timeout           = 600
  wait              = false
  values = [
    <<EOF
deployKey: ${var.deploy_key}
useEtcdOperator: false
version: ${var.vizier_version}
clusterName: ${var.cluster_name}
cloudAddr: ${var.cloud_address}
disableAutoUpdate: ${var.disable_auto_update}
%{if var.vizier_pem_node_selector != null}
pod:
  nodeSelector:
      ${var.vizier_pem_node_selector.label}: ${var.vizier_pem_node_selector.value}
%{endif}
%{if var.vizier_pem_tolerations != null}
patches:
  vizier-pem: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  pl-nats: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  pl-etcd: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  kelvin: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  vizier-cloud-connector: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  vizier-metadata: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
  vizier-query-broker: '{"spec": {"template": {"spec": { "tolerations": ${jsonencode(var.vizier_pem_tolerations)}}}}}'
%{endif}
EOF
  ]
}
