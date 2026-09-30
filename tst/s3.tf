module "digital_portal_tools" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.5.0"
  bucket  = "${var.infra_prefix}-${var.accounts["dev"]}-${var.region}-tools"

  # Enable default encryption with SSE-S3
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.default_tags
}
# module "portal_logs" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "4.5.0"
#   bucket  = "gdp-iagcargo-dev-portal-analytics-outbound"

#   versioning = {
#     enabled = true
#   }

#   lifecycle_rule = [
#     {
#       abort_incomplete_multipart_upload_days = 7
#       expiration = {
#         days = 7
#       }
#       filter = {
#         # prefix = "dms/portal/CARGOIAG/IATA_"
#       }
#       id = "DeleteRule"
#       noncurrent_version_expiration = {
#         days = 7
#       }
#       status = "Enabled"
#     },
#   ]

#   server_side_encryption_configuration = {
#     rule = {
#       apply_server_side_encryption_by_default = {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = var.default_tags
# }
# module "ebooking_search_routedetails" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "4.5.0"
#   bucket  = "${var.infra_prefix}-${var.accounts["dev"]}-${var.region}-ebooking-routedetails"

#   # versioning = {
#   #   enabled = true
#   # }

#   lifecycle_rule = [
#     {
#       abort_incomplete_multipart_upload_days = 1
#       expiration = {
#         days = 1
#       }
#       filter = {
#         # prefix = "stg/"
#       }
#       id = "DeleteRule"
#       noncurrent_version_expiration = {
#         days = 1
#       }
#       status = "Enabled"
#     },
#   ]

#   server_side_encryption_configuration = {
#     rule = {
#       apply_server_side_encryption_by_default = {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   tags = var.default_tags
# }