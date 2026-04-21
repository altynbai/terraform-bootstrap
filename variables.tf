variable "dynamodb_table_name" {
  type = string
  default = "digital-portal-terraform-state"
}

variable "s3_bucket_name" {
  type = string
  default = "digital-portal-terraform-state-stg"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}
