
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
  }
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_caller_identity" "current" {}

locals {
  azs                               = slice(data.aws_availability_zones.available.names, 0, 3)
  project-name                      = var.project-name
  ebs_csi_service_account_namespace = "kube-system"
  ebs_csi_service_account_name      = "ebs-csi-controller-sa"
  cluster_service_ipv4_cidr         = var.cluster_service_ipv4_cidr
  eks-worker-type                   = var.eks-worker-type
  eks-version                       = var.eks-version
  tags = merge(var.tags, {
    yb_owner   = var.project-owner
    yb_project = local.project-name
  })
}
