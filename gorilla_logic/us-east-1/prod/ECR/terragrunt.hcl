include {
    path = find_in_parent_folders()
}

terraform {
    source = "${get_terragrunt_dir()}/../../../../modules//ecr"
}

inputs = {
# Provider
    region              = "us-east-1"
    accountId           = "123707704970"
    
#ECR
    application_name    = "timeoff-management"

}