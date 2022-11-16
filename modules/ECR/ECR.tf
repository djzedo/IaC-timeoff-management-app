# Elastic Container Repository for Docker images
resource "aws_ecr_repository" "ng_container_repository" {
  name = var.application_name
}