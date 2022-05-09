resource "kubernetes_namespace" "kubernetes_efs_csi_driver" {
  count      = (var.enabled && var.create_namespace && var.namespace != "kube-system") ? 1 : 0

  metadata {
    name = var.namespace
  }
}



#comman tags
module "tags" {
    source = "./common_tags"

    stack = var.stack
    name = var.name
    enviroment = var.enviroment
    additional_tags = var.additional_tags
}
