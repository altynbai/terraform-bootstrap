# resource "aws_security_group" "vpc_lambda_security_group" {
#   description = "Lambda Security Group"
#   name        = "${var.infra_prefix}-lambda-sg"
#   tags        = var.default_tags
#   vpc_id      = module.vpc.vpc_id
# }
# resource "aws_vpc_security_group_egress_rule" "vpc_outbound_all" {
#   cidr_ipv4         = "0.0.0.0/0"
#   description       = "Allow access to 0.0.0.0/0"
#   ip_protocol       = "-1"
#   security_group_id = aws_security_group.vpc_lambda_security_group.id
#   tags              = var.default_tags
# }
# resource "aws_security_group" "vpc_endpoint_sg" {
#   description = "VPC Endpoint Security Group"
#   name        = "${var.infra_prefix}-vpce-sg"
#   tags        = var.default_tags
#   vpc_id      = module.vpc.vpc_id
# }
# resource "aws_vpc_security_group_ingress_rule" "vpc_all" {
#   description                  = "Allow access from VPC private range"
#   from_port                    = 443
#   to_port                      = 443
#   ip_protocol                  = "tcp"
#   security_group_id            = aws_security_group.vpc_endpoint_sg.id
#   referenced_security_group_id = aws_security_group.vpc_lambda_security_group.id
#   tags                         = var.default_tags
# }
# resource "aws_vpc_security_group_egress_rule" "allow_all" {
#   cidr_ipv4         = "0.0.0.0/0"
#   description       = "Allow access to 0.0.0.0/0"
#   ip_protocol       = "-1"
#   security_group_id = aws_security_group.vpc_endpoint_sg.id
#   tags              = var.default_tags
# }