remote_state {
    backend = "s3"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite_terragrunt"
    }
    config = {
        bucket         = "gorilla-global-tf-backend-state"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        region         = "us-east-1"
        encrypt        = true
        dynamodb_table = "gorilla-global-tf-backend-lock-state"
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
  hosted_zone = "gorilla.creditodigitalinteligente.com"
  namespace   = "gorilla"
  environment = "global"
  region  = "us-east-1"
  tags = {
    maintainer       = "psalzedo"
    iac_tool         = "terraform"
    iac_tool_verison = "0.14.4"
  }
}
