# gorilla_acc/us-east-1/env/prod/terragrunt.hcl
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket         = "gorilla-prod-tf-backend-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "gorilla-prod-tf-backend-lock-state"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region  = var.region
  assume_role {
    # role_arn = "arn:aws:iam::0123456789:role/terragrunt"
  }
}
EOF
}

inputs = {
  accountId = "123707704970"
  hosted_zone = "gorilla.timeoff-management.com"
  namespace   = "gorilla"
  environment = "prod"
  region  = "us-east-1"
  tags = {
    maintainer       = "psalzedo"
    iac_tool         = "terraform"
    iac_tool_verison = "1.13.0"
  }
}
