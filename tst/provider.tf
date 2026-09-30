provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::${var.accounts["tst"]}:role/${var.github_role_name}"
  }
}

# Provider used for cross-account Lambda lookups.
provider "aws" {
  alias  = "bi_nom"
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::352587390049:role/bi-nom-github-actions-role-admin"
  }
}

# Add a second provider alias for global services
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::${var.accounts["tst"]}:role/${var.github_role_name}"
  }
}
