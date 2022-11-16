include {
    path = find_in_parent_folders()
}

terraform {
    source = "${get_terragrunt_dir()}/../../../../modules//s3_EB_task_def"
}

inputs = {
# Provider
    region              = "us-east-1"
    accountId           = "123707704970"
    application_name    = "timeoff-management"
}