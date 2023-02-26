resource "aws_iam_role" "yba" {
  name = "${var.prefix}-YBARoleWithSSMAndS3"


  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    aws_iam_policy.yba.arn
  ]

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "yba" {
  name = "${var.prefix}-YBAInstanceProfile"
  role = aws_iam_role.yba.name
}

resource "aws_iam_policy" "yba" {
  name        = "${var.prefix}-YBAPolicy"
  description = "YBA Portal - AWS Deployment Policy"
  policy      = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "HostedZoneEditor",
        "Effect" : "Allow",
        "Action" : [
          "route53:ChangeResourceRecordSets"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "HostedZoneReader",
        "Effect" : "Allow",
        "Action" : [
          "route53:Get*",
          "route53:List*"
        ],
        "Resource" : "*"
      },
      {
        "Sid": "IamReader",
        "Effect": "Allow",
        "Action": [
          "iam:GetRole"
        ],
        "Resource": "*"
      },
      {
        "Sid": "KMSManagement",
        "Effect": "Allow",
        "Action": [
          "kms:CreateKey",
          "kms:ListAliases",
          "kms:ListKeys",
          "kms:CreateAlias",
          "kms:DeleteAlias",
          "kms:UpdateAlias",
          "kms:TagResource"
        ],
        "Resource": "*"
      },
      {
        "Sid": "KMSDecryptor",
        "Effect": "Allow",
        "Action": [
          "kms:Decrypt",
          "kms:GenerateDataKey"

        ],
        "Resource": "*"
      },
      {
        "Sid" : "EC2Manager",
        "Effect" : "Allow",
        "Action" : [
          "ec2:AttachVolume",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:ImportVolume",
          "ec2:ModifyVolumeAttribute",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceAttribute",
          "ec2:CreateKeyPair",
          "ec2:DescribeVolumesModifications",
          "ec2:DeleteVolume",
          "ec2:DescribeVolumeStatus",
          "ec2:StartInstances",
          "ec2:DescribeAvailabilityZones",
          "ec2:CreateSecurityGroup",
          "ec2:DescribeVolumes",
          "ec2:ModifyInstanceAttribute",
          "ec2:DescribeKeyPairs",
          "ec2:DescribeInstanceStatus",
          "ec2:DetachVolume",
          "ec2:ModifyVolume",
          "ec2:TerminateInstances",
          "ec2:AssignIpv6Addresses",
          "ec2:ImportKeyPair",
          "ec2:DescribeTags",
          "ec2:CreateTags",
          "ec2:RunInstances",
          "ec2:AssignPrivateIpAddresses",
          "ec2:StopInstances",
          "ec2:AllocateAddress",
          "ec2:DescribeVolumeAttribute",
          "ec2:DescribeSecurityGroups",
          "ec2:CreateVolume",
          "ec2:EnableVolumeIO",
          "ec2:DescribeImages",
          "ec2:DescribeVpcs",
          "ec2:DeleteSecurityGroup",
          "ec2:DescribeSubnets",
          "ec2:DeleteKeyPair",
          "ec2:DescribeVpcPeeringConnections",
          "ec2:DescribeRouteTables",
          "ec2:DescribeInternetGateways",
          "ec2:AssociateRouteTable",
          "ec2:AttachInternetGateway",
          "ec2:CreateInternetGateway",
          "ec2:CreateRoute",
          "ec2:CreateSubnet",
          "ec2:CreateVpc",
          "ec2:CreateVpcPeeringConnection",
          "ec2:AcceptVpcPeeringConnection",
          "ec2:DisassociateRouteTable",
          "ec2:ModifyVpcAttribute",
          "ec2:GetConsoleOutput",
          "ec2:CreateSnapshot",
          "ec2:DeleteSnapshot",
          "ec2:DescribeInstanceTypes"
        ],
        "Resource" : "*"
      }
    ]
  })
}



resource "aws_iam_role" "ssm" {
  name = "${var.prefix}-RoleWithSSMAndS3"


  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonSSMPatchAssociation",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_instance_profile" "ssm" {
  name = "${var.prefix}-SSMInstanceProfile"
  role = aws_iam_role.ssm.name
}
