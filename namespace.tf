resource "kubernetes_namespace" "kubernetes_efs_csi_driver" {
  metadata {
    name = var.namespace
  }
}
