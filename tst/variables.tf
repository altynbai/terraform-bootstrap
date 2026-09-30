variable "region" {
  type = string
}
variable "default_tags" {
  type = map(any)
}
variable "github_role_name" {
  type = string
}
variable "accounts" {
  type = map(any)
}
variable "ecp_ipam" {
  type = string
}
variable "netmask_length" {
  default = 23
  type    = number
}
variable "infra_prefix" {
  type = string
}
# variable "private_subnet_cidrs" {
#   type    = list(string)
#   default = []
# }
# variable "public_subnet_cidrs" {
#   type    = list(string)
#   default = []
# }
# variable "repositories" {
#   type    = list(string)
#   default = ["booking", "widget"]
# }
# variable "oracle_user" {
#   type        = string
#   sensitive   = true
#   description = "Portal DB username."
# }
# variable "oracle_password" {
#   type        = string
#   sensitive   = true
#   description = "Portal DB password."
# }
# variable "oracle_connection" {
#   type        = string
#   sensitive   = true
#   description = "Portal DB connection string (EZCONNECT/DSN)."
# }
# variable "oracle_user_notification" {
#   type        = string
#   sensitive   = true
#   description = "Portal DB username."
# }
# variable "oracle_password_notification" {
#   type        = string
#   sensitive   = true
#   description = "Portal DB password."
# }
# variable "tgw_subnet_cidrs" {
#   type    = list(string)
#   default = []
# }
# variable "tgw_cidr" {
#   type = string
# }
# variable "tgw_id" {
#   type = string
# }
# variable "ib_subnet_cidr" {
#   type = string
# }
# variable "optima_user" {
#   type        = string
#   sensitive   = true
#   description = "optima username."
# }
# variable "optima_password" {
#   type        = string
#   sensitive   = true
#   description = "optima password."
# }
# variable "optima_url" {
#   type        = string
#   sensitive   = true
#   description = "optima url"
# }
# variable "spot_user" {
#   type        = string
#   sensitive   = true
#   description = "optima username."
# }
# variable "spot_password" {
#   type        = string
#   sensitive   = true
#   description = "optima password."
# }
# variable "spot_url" {
#   type        = string
#   sensitive   = true
#   description = "optima url"
# }
# variable "spot_update_quote_url" {
#   type        = string
#   sensitive   = true
#   description = "spot update quote url"
# }
# variable "spot_validate_quote_url" {
#   type        = string
#   sensitive   = true
#   description = "spot validate quote url"
# }
# variable "rules-engine_user" {
#   type        = string
#   sensitive   = true
#   description = "optima username."
# }
# variable "rules-engine_password" {
#   type        = string
#   sensitive   = true
#   description = "optima password."
# }
# variable "rules-engine_url" {
#   type        = string
#   sensitive   = true
#   description = "optima url"
# }

# variable "eventbridge_bus_name" {
#   type        = string
#   description = "Name of the shared EventBridge bus used by Lambda producers and consumers in dev."
#   default     = "digital-portal-dev-shared-bus"
# }

# variable "eventbridge_dlq_name" {
#   type        = string
#   description = "Name of the SQS DLQ that receives EventBridge delivery failures."
#   default     = "digital-portal-dev-eventbridge-dlq"
# }

# variable "SMTP_HOST" {
#   type        = string
#   sensitive   = true
#   description = "SMTP host"
# }
# variable "SMTP_PORT" {
#   type        = number
#   sensitive   = true
#   description = "SMTP port"
# }
# variable "SMTP_USER" {
#   type        = string
#   sensitive   = true
#   description = "SMTP username"
# }
# variable "SMTP_PASSWORD" {
#   type        = string
#   sensitive   = true
#   description = "SMTP password"
# }
# variable "SMTP_SENDER" {
#   type        = string
#   sensitive   = true
#   description = "SMTP sender email address"
# }
# variable "SMTP_SENDER_NAME" {
#   type = string
#   sensitive = true
#   description = "SMTP sender name"
# }
# variable "SMTP_DEVELOPER_EMAILS" {
#   type = string
#   sensitive = true
#   description = "SMTP developer emails"
# }

# variable "CMS_ACCESS_TOKEN" {
#   type = string
#   sensitive = true
#   description = "CMS access token"
# }
# variable "CMS_SPACE_ID" {
#   type = string
#   sensitive = true
#   description = "CMS space ID"
# }
# variable "CMS_ENVIRONMENT_ID" {
#   type = string
#   sensitive = true
#   description = "CMS environment ID"
# }
# variable "FILE_FALLBACK_LINK_EN" {
#   type = string
#   sensitive = true
#   description = "File fallback link for English content"
# }
# variable "FILE_FALLBACK_LINK_ES" {
#   type = string
#   sensitive = true
#   description = "File fallback link for Spanish content"
# }