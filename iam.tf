# IAM role for GitHub Actions
resource "aws_iam_role" "cust_dev_github_actions_role" {
  name = "cust-dev-github-actions-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::984625844635:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              "repo:IAG-Cargo/bi-nom*:*",
              "repo:IAG-Cargo@*/bi-nom*:*"
            ]
          }
        }
      }
    ]
  })

  tags = {
    Name = "cust-dev-github-actions-role"
  }
}

# IAM policy for GitHub Actions role
resource "aws_iam_role_policy" "cust_dev_github_actions_policy" {
  name = "cust-dev-github-actions-policy"
  role = aws_iam_role.cust_dev_github_actions_role.id

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
        Resource = "arn:aws:dynamodb:eu-west-1:984625844635:table/cust-dev-terraform-state"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "arn:aws:s3:::cust-dev-terraform-state-stg"
      },
      {
        Sid    = ""
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ]
        Resource = "arn:aws:s3:::cust-dev-terraform-state-stg/*"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "ssm:GetParameter"
        Resource = "arn:aws:ssm:eu-west-1:984625844635:parameter/terraform.tfvars.json"
      },
      {
        Sid      = ""
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = "arn:aws:iam::984625844635:role/cust-dev-github-actions-role-admin"
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
resource "aws_iam_role" "cust_dev_github_actions_role_admin" {
  name = "cust-dev-github-actions-role-admin"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = ""
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::984625844635:role/cust-dev-github-actions-role"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "cust-dev-github-actions-role-admin"
  }
}

# Attach AdministratorAccess policy to the admin role
resource "aws_iam_role_policy_attachment" "cust_dev_github_actions_admin_policy" {
  role       = aws_iam_role.cust_dev_github_actions_role_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
