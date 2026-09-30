# resource "aws_iam_role" "backend_api_cognito_admin_role" {
#   name = "${var.infra_prefix}-backend-api-cognito-admin-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = "arn:aws:iam::352587390049:role/sam-bi-nom-backend-api-role"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
#   tags = var.default_tags
# }

# resource "aws_iam_role_policy" "backend_api_cognito_admin_policy" {
#   name = "cognito-admin-user-management"
#   role = aws_iam_role.backend_api_cognito_admin_role.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "cognito-idp:AdminCreateUser",
#           "cognito-idp:AdminGetUser",
#           "cognito-idp:AdminUpdateUserAttributes",
#           "cognito-idp:AdminDeleteUser",
#           "cognito-idp:AdminSetUserPassword",
#           "cognito-idp:AdminAddUserToGroup"
#         ]
#         Resource = aws_cognito_user_pool.portal.arn
#       }
#     ]
#   })
# }

# resource "aws_iam_role" "token_service_cognito_admin_role" {
#   name = "bi-nom-token-service-cognito-admin-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           AWS = [
#             "arn:aws:iam::759975070675:role/sam-portal-token-service-IssueTokenFunctionRole-88kfySbFQzdl",
#             "arn:aws:iam::759975070675:role/sam-portal-token-service-InvalidationFunctionRole-wq0f04aNRcOh"
#           ]
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
#   tags = var.default_tags
# }

# resource "aws_iam_role_policy" "token_service_cognito_admin_policy" {
#   name = "token-service-cognito-admin-user-management"
#   role = aws_iam_role.token_service_cognito_admin_role.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "cognito-idp:AdminGetUser",
#           "cognito-idp:AdminCreateUser",
#           "cognito-idp:AdminUpdateUserAttributes",
#           "cognito-idp:AdminSetUserPassword",
#           "cognito-idp:AdminListGroupsForUser",
#           "cognito-idp:AdminAddUserToGroup",
#           "cognito-idp:AdminRemoveUserFromGroup",
#           "cognito-idp:AdminInitiateAuth",
#           "cognito-idp:AdminUserGlobalSignOut"
#         ]
#         Resource = "arn:aws:cognito-idp:eu-west-1:600286788722:userpool/eu-west-1_aJvaJO78f"
#       }
#     ]
#   })
# }
