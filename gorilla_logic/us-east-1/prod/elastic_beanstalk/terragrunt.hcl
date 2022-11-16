include {
    path = find_in_parent_folders()
}

terraform {
    source = "${get_terragrunt_dir()}/../../../../modules//elastic_beanstalk"
}

inputs = {
# Provider
    region  = "us-east-1"
    accountId = "123707704970"


# Elastic Beanstalk
    iam_beanstlak_instance_profile  = "ng-beanstalk-ec2-user"
    aws_iam_role_beanstalk          = "ng-beanstalk-ec2-role"
    aws_iam_role_policy             = "ng_beanstalk_ec2_policy_with_ECR"
# Beanstalk Application
    application_name                = "timeoff-management"
    application_description         = "time off"
    application_environment         = "prod"
# Beanstalk Environment
    solution_stack_name             = "64bit Amazon Linux 2 v3.5.1 running Docker"
    tier                            = "WebServer"
    #setting
    launch_config_namespace         = "aws:autoscaling:launchconfiguration"
    instance_name                   = "InstanceType"
    instance_value                  = "t2.micro"
    #setting
    asg_namespace                   = "aws:autoscaling:asg"
    asg_name                        = "MaxSize"
    asg_value                       = "2"
    #setting
    asg_launch_config_namespace     = "aws:autoscaling:launchconfiguration"
    asg_launch_config_name         = "IamInstanceProfile"
}