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
          "iam:GetRole",
          "iam:PassRole"
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
          "ec2:*",
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
