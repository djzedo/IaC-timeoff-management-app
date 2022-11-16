include {
    path = find_in_parent_folders()
}

terraform {
    source = "${get_terragrunt_dir()}/../../../../../modules//s3_tf_backend"
}                                   

inputs = {
    name               = "tf-backend"
    attributes         = ["state"]
    additional_tag_map = {
        "stable" = false
    }
    tags = {
        "maintaner"        = "psalzedo",
        "iac-tool"         = "terraform",
        "iac-tool-version" = "0.14.4",
        "automate"         = "true"
    }
}