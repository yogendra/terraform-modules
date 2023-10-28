module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "${local.project-name}-eks"
  cluster_version = local.eks-version

  cluster_endpoint_public_access = true

  enable_irsa = true

  cluster_addons = {
    aws-ebs-csi-driver = {
      service_account_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.project-name}-eks-ebs-csi-controller"
      most_recent              = true
    }
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      before_compute = true
      most_recent    = true
    }
  }

  vpc_id                    = local.vpc-id
  subnet_ids                = local.worker-subnets
  control_plane_subnet_ids  = local.constoler-plane-subnets
  cluster_ip_family         = "ipv4"
  cluster_service_ipv4_cidr = local.cluster_service_ipv4_cidr

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    use_custom_launch_template = false

    min_size     = 0
    max_size     = 3
    desired_size = 1

    disk_size                  = 50
    instance_types             = [local.eks-worker-type]
    iam_role_attach_cni_policy = true

    capacity_type   = "SPOT"
    use_name_prefix = false
    tags = merge(local.tags, {
      yb_aws_service       = "eks"
      yb_aws_resource_type = "worker"
    })
  }

  eks_managed_node_groups = { for idx, az in local.azs :
    "${local.project-name}-${idx}" => {
      availability_zones = [az]
      subnet_ids         = [local.worker-subnets[idx]]
    }
  }


  tags = merge(local.tags, {
    Name                 = "${local.project-name}-eks"
    yb_aws_service       = "eks"
    yb_aws_resource_type = "eks"
  })

}


provider "kubernetes" {
  host = module.eks.cluster_endpoint

  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks.cluster_name
    ]
  }
}


provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        module.eks.cluster_name
      ]
    }
  }
}

