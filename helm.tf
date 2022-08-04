data "template_file" "kubernetes_efs_csi_driver" {
	template = file("./charts/aws-efs-csi-driver/values.yaml")
}

resource "helm_release" "kubernetes_efs_csi_driver" {
  depends_on = [aws_iam_role.efs_csi_driver]
  chart = "./charts/aws-efs-csi-driver/"
  name = "aws-efs-csi"
  #repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"
  timeout = 1800
  #namespace = var.namespace

# values = [
 # 	data.template_file.values.rendered
  #]
 
  set {
    name = "image.repository"
    #TODO create lookup
    value = "${local.image_lookup[var.region]}eks/aws-efs-csi-driver"
  }
  set {
    name  = "controller.serviceAccount.create"
    value = false
  }
  set {
    name  = "controller.serviceAccount.name"
    value = var.efs_csi_service_account_name
  }
}

locals {
  image_lookup = {
    "af-south-1"     = "877085696533.dkr.ecr.af-south-1.amazonaws.com/"
    "ap-east-1"      = "800184023465.dkr.ecr.ap-east-1.amazonaws.com/"
    "ap-northeast-1" = "602401143452.dkr.ecr.ap-northeast-1.amazonaws.com/"
    "ap-northeast-2" = "602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/"
    "ap-northeast-3" = "602401143452.dkr.ecr.ap-northeast-3.amazonaws.com/"
    "ap-south-1"     = "602401143452.dkr.ecr.ap-south-1.amazonaws.com/"
    "ap-southeast-1" = "602401143452.dkr.ecr.ap-southeast-1.amazonaws.com/"
    "ap-southeast-2" = "602401143452.dkr.ecr.ap-southeast-2.amazonaws.com/"
    "ca-central-1"   = "602401143452.dkr.ecr.ca-central-1.amazonaws.com/"
    "cn-north-1"     = "918309763551.dkr.ecr.cn-north-1.amazonaws.com.cn/"
    "cn-northwest-1" = "961992271922.dkr.ecr.cn-northwest-1.amazonaws.com.cn/"
    "eu-central-1"   = "602401143452.dkr.ecr.eu-central-1.amazonaws.com/"
    "eu-north-1"     = "602401143452.dkr.ecr.eu-north-1.amazonaws.com/"
    "eu-south-1"     = "590381155156.dkr.ecr.eu-south-1.amazonaws.com/"
    "eu-west-1"      = "602401143452.dkr.ecr.eu-west-1.amazonaws.com/"
    "eu-west-2"      = "602401143452.dkr.ecr.eu-west-2.amazonaws.com/"
    "eu-west-3"      = "602401143452.dkr.ecr.eu-west-3.amazonaws.com/"
    "me-south-1"     = "558608220178.dkr.ecr.me-south-1.amazonaws.com/"
    "sa-east-1"      = "602401143452.dkr.ecr.sa-east-1.amazonaws.com/"
    "us-east-1"      = "602401143452.dkr.ecr.us-east-1.amazonaws.com/"
    "us-east-2"      = "602401143452.dkr.ecr.us-east-2.amazonaws.com/"
    "us-gov-east-1"  = "151742754352.dkr.ecr.us-gov-east-1.amazonaws.com/"
    "us-gov-west-1"  = "013241004608.dkr.ecr.us-gov-west-1.amazonaws.com/"
    "us-west-1"      = "602401143452.dkr.ecr.us-west-1.amazonaws.com/"
    "us-west-2"      = "602401143452.dkr.ecr.us-west-2.amazonaws.com/"
  }
}
