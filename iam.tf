# IAM role for GitHub Actions
resource "aws_iam_role" "digital_portal_github_actions_role" {
  name = "digital-portal-github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::150390107516:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              "repo:IAG-Cargo/digital-portal_aws-core-infra:*",
              "repo:IAG-Cargo/digital-customer_*:*",
              "repo:IAG-Cargo/digital-distribution_performance_test:*"
            ]
          }
        }
      }
    ]
  })

  tags = {
    Name = "digital-portal-github-actions-role"
  }
}

# IAM policy for GitHub Actions role
resource "aws_iam_role_policy" "digital_portal_github_actions_policy" {
  name = "digital-portal-github-actions-policy"
  role = aws_iam_role.digital_portal_github_actions_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:DescribeTable",
          "dynamodb:DeleteItem"
        ]
        Resource = "arn:aws:dynamodb:eu-west-1:150390107516:table/digital-portal-terraform-state"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::digital-portal-terraform-state-uat"
      },
      {
        Sid    = ""
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::digital-portal-terraform-state-uat/*"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "ssm:GetParameter"
        Resource = "arn:aws:ssm:eu-west-1:150390107516:parameter/terraform.tfvars.json"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::150390107516:role/digital-portal-github-actions-role-admin"
      },
      {
        Sid    = ""
        Effect = "Allow"
        Action = "cloudwatch:putMetricData"
        Resource = "*"
        Condition = {
          StringLike = {
            "cloudwatch:namespace" = "Github"
          }
        }
      }
    ]
  })
}

# IAM role for GitHub Actions Admin
resource "aws_iam_role" "digital_portal_github_actions_role_admin" {
  name = "digital-portal-github-actions-role-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::150390107516:role/digital-portal-github-actions-role"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "digital-portal-github-actions-role-admin"
  }
}

# Attach AdministratorAccess policy to the admin role
resource "aws_iam_role_policy_attachment" "digital_portal_github_actions_admin_policy" {
  role       = aws_iam_role.digital_portal_github_actions_role_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
