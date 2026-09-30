# module "ssm_parameters" {
#   source = "../../modules/ssm"
#   tags   = var.default_tags

#   values = {
#     "/environment/vpc/private_subnets"              = join(",", module.vpc.private_subnets)
#     "/environment/vpc/lambda_sg"                    = aws_security_group.vpc_lambda_security_group.id
#   }
# }