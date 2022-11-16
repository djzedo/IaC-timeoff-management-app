variable "region" {
    type        = string
    description = "AWS region"
    default     = "us-east-1"
}

variable "accountId" {
    type        = string
    description = "description"
}

# Beanstalk Application
variable "application_name" {
    description = "Name of app"
}

variable "application_description" {
    description = "Description"
}

variable "application_environment" {
    description = "env"
}
####################################
# Elastic Beanstalk
variable "iam_beanstlak_instance_profile" {
    type        = string
    description = "iam instance profile for beanstalk ec2"
}

variable "aws_iam_role_beanstalk" {
    type        = string
    description = "iam role for beanstalk ec2"
}

variable "aws_iam_role_policy" {
    type        = string
    description = "iam role for beanstalk ec2"
}
####################################
# Beanstalk Environment
variable "solution_stack_name" {
    type        = string
    description = "Description"
}

variable "tier" {
    type        = string
    description = "Description"
}
    #Setting
    variable "launch_config_namespace" {
        type = string
        description = "description"
    }
    variable "instance_name" {
        type = string
        description = "description"
    }
    variable "instance_value" {
        type = string
        description = "description"
    }

     variable "asg_namespace" {
        type = string
        description = "description"
    }
     variable "asg_name" {
        type = string
        description = "description"
    }
     variable "asg_value" {
        type = string
        description = "description"
    }

      variable "asg_launch_config_namespace" {
        type = string
        description = "description"
    }
      variable "asg_launch_config_name" {
        type = string
        description = "description"
    }




