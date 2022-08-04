variable "region" {
    type = string
    default = "us-east-1"
}
variable "eks_cluster_id" {
    type = string
    default = " "
}

variable "efs_csi_service_account_name" {
    type = string
    default = "efs-csi-driver-service-account"
}

variable "cluster_identity_oidc_issuer" {
    type = string
    default = " "
}

variable "cluster_identity_oidc_issuer_arn" {
    type = string
    default = " "
}

variable "efs_csi_role_name" {
    type= string
    default = "aws-eks-efs-csi-driver-role"
}

variable "efs_csi_policy_name" {
    type= string
    default = "aws-eks-efs-csi-driver-policy"
}

variable "namespace"{
    type = string
    default = "efs-csi-driver"
    
}

variable "storage_class_name" {
    type =string
    default = "efs-csi-storage"
}

variable "enabled" {
    type = bool
    default = true
}
