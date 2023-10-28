
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


data "aws_caller_identity" "current" {}
data "aws_route53_zone" "project-hosted-zone" {
  private_zone = false
  id = local.project-route53-hosted-zone
}

locals {

  project-name                      = var.project-name
  ebs_csi_service_account_namespace = "kube-system"
  ebs_csi_service_account_name      = "ebs-csi-controller-sa"
  cluster_service_ipv4_cidr         = var.cluster_service_ipv4_cidr
  eks-worker-type                   = var.eks-worker-type
  eks-version                       = var.eks-version
  project-route53-hosted-zone       = var.project-route53-hosted-zone
  project-route53-hosted-zone-domain = replace(data.aws_route53_zone.project-hosted-zone.name, "\\.$", "")
  project-domain                    = var.project-domain != null ? var.project-domain : "${local.project-name}.${data.aws_route53_zone.project-hosted-zone.name}"
  tags = merge(var.tags, {
    yb_owner   = var.project-owner
    yb_project = local.project-name
  })
  vpc-id = var.vpc-id
  worker-subnets = var.worker-subnets
  constoler-plane-subnets = var.control-plane-subnets
  azs = data.aws_subnet.worker-subnets[*].availability_zon

}


data "aws_subnet" "worker-subnets" {
  count = length(local.worker-subnets)
  vpc_id = local.vpc-id
  id       = local.worker-subnets[count.index]
}

