# Beanstalk instance profile
resource "aws_iam_instance_profile" "ng_beanstalk_ec2" {
    name  = var.iam_beanstlak_instance_profile
    role = aws_iam_role.ng_beanstalk_ec2.name
}

resource "aws_iam_role" "ng_beanstalk_ec2" {
    name = var.aws_iam_role_beanstalk
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": "sts:AssumeRole",
        "Principal": {
            "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
        }
    ]
}
EOF
}

# Beanstalk EC2 Policy
# Overriding because by default Beanstalk does not have a permission to Read ECR
resource "aws_iam_role_policy" "ng_beanstalk_ec2_policy" {
  name = var.aws_iam_role_policy
  role = aws_iam_role.ng_beanstalk_ec2.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "cloudwatch:PutMetricData",
        "ds:CreateComputer",
        "ds:DescribeDirectories",
        "ec2:DescribeInstanceStatus",
        "logs:*",
        "ssm:*",
        "ec2messages:*",
        "ecr:GetAuthorizationToken",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetDownloadUrlForLayer",
        "ecr:GetRepositoryPolicy",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecr:DescribeImages",
        "ecr:BatchGetImage",
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Beanstalk Application
resource "aws_elastic_beanstalk_application" "ng_beanstalk_application" {
  name        = var.application_name
  description = var.application_description
}

# Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "ng_beanstalk_application_environment" {
  name                = "${var.application_name}-${var.application_environment}"
  application         = aws_elastic_beanstalk_application.ng_beanstalk_application.name
  solution_stack_name = var.solution_stack_name
  tier                = var.tier

  setting {
    namespace = var.launch_config_namespace
    name      = var.instance_name

    # Todo: As Variable
    value = var.instance_value
  }

  setting {
    namespace = var.asg_namespace
    name      = var.asg_name

    # Todo: As Variable
    value = var.asg_value
  }

  setting {
    namespace = var.asg_launch_config_namespace
    name      = var.asg_launch_config_name
    value     = aws_iam_instance_profile.ng_beanstalk_ec2.name
  }
}
