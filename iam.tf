# IAM role for GitHub Actions
resource "aws_iam_role" "customer_id_platform_github_actions_role" {
  name = "customer-id-platform-github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::362346190457:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
                "repo:IAG-Cargo/customer-id-platform*:*",
                "repo:IAG-Cargo@*/customer-id-platform*:*"
            ]
          }
        }
      }
    ]
  })

  tags = {
    Name = "customer-id-platform-github-actions-role"
  }
}

# IAM policy for GitHub Actions role
resource "aws_iam_role_policy" "customer_id_platform_github_actions_policy" {
  name = "customer-id-platform-github-actions-policy"
  role = aws_iam_role.customer_id_platform_github_actions_role.id

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
        Resource = "arn:aws:dynamodb:eu-west-1:362346190457:table/customer-id-platform-terraform-state"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::customer-id-platform-terraform-state-tst"
      },
      {
        Sid    = ""
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::customer-id-platform-terraform-state-tst/*"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "ssm:GetParameter"
        Resource = "arn:aws:ssm:eu-west-1:362346190457:parameter/terraform.tfvars.json"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::362346190457:role/customer-id-platform-github-actions-role-admin"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "cloudwatch:putMetricData"
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
resource "aws_iam_role" "customer_id_platform_github_actions_role_admin" {
  name = "customer-id-platform-github-actions-role-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::362346190457:role/customer-id-platform-github-actions-role"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "customer-id-platform-github-actions-role-admin"
  }
}

# Attach AdministratorAccess policy to the admin role
resource "aws_iam_role_policy_attachment" "customer_id_platform_github_actions_admin_policy" {
  role       = aws_iam_role.customer_id_platform_github_actions_role_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
