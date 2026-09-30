variable "dynamodb_table_name" {
  type    = string
  default = "bi-nom-terraform-state"
}

variable "s3_bucket_name" {
  type    = string
  default = "bi-nom-terraform-state-tst"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-1"
}
