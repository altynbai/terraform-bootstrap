# terraform-bootstrap

Creates S3 bucket, DynamoDB table and IAM roles


1. Cloudshell TF installation

# Get tfenv
git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
# Add tfenv path to your bash profile
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc
# Reload your shell configurations
source ~/.bashrc
# Download and install version 1.6.4
tfenv install 1.6.4
# Set 1.6.4 as your active system binary
tfenv use 1.6.4
# Verify
terraform version

2. Clone this repo and apply
3. Add GitHub as OpenID Connect provider in AWS
   - url https://token.actions.githubusercontent.com
   - audience sts.amazonaws.com
   - tag terraform=false
4. Configure IAM roles in GitHub repo settings
   - Add new environment
   - Secrets and variables
   - AWS_ROLE_[] -- arn:aws:iam::984625844635:role/cust-dev-github-actions-role
     - TF_STATE_BUCKET_[] -- bi-nom-terraform-state-stg
5. Add terraform.tfvars.json into SSM Paramter Store
6.


