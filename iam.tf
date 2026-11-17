# IAM role for GitHub Actions
resource "aws_iam_role" "sfdc_integration_github_actions_role" {
  name = "sfdc-integration-github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::212102926396:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              "repo:IAG-Cargo/sfdc-integration*:*",
              "repo:IAG-Cargo@*/sfdc-integration*:*",
              "repo:IAG-Cargo/digital-distribution*:*",
              "repo:IAG-Cargo@*/digital-distribution*:*"
            ]
          }
        }
      }
    ]
  })

  tags = {
    Name = "sfdc-integration-github-actions-role"
  }
}

# IAM policy for GitHub Actions role
resource "aws_iam_role_policy" "sfdc_integration_github_actions_policy" {
  name = "sfdc-integration-github-actions-policy"
  role = aws_iam_role.sfdc_integration_github_actions_role.id

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
        Resource = "arn:aws:dynamodb:eu-west-1:212102926396:table/sfdc-integration-terraform-state"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::sfdc-integration-terraform-state-dev"
      },
      {
        Sid    = ""
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::sfdc-integration-terraform-state-dev/*"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "ssm:GetParameter"
        Resource = "arn:aws:ssm:eu-west-1:212102926396:parameter/terraform.tfvars.json"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::212102926396:role/sfdc-integration-github-actions-role-admin"
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
resource "aws_iam_role" "sfdc_integration_github_actions_role_admin" {
  name = "sfdc-integration-github-actions-role-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::212102926396:role/sfdc-integration-github-actions-role"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "sfdc-integration-github-actions-role-admin"
  }
}

# Attach AdministratorAccess policy to the admin role
resource "aws_iam_role_policy_attachment" "sfdc_integration_github_actions_admin_policy" {
  role       = aws_iam_role.sfdc_integration_github_actions_role_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
