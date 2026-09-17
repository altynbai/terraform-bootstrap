variable "dynamodb_table_name" {
  type    = string
  default = "customer-id-platform-terraform-state"
}

variable "s3_bucket_name" {
  type    = string
  default = "customer-id-platform-terraform-state-tst"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}
