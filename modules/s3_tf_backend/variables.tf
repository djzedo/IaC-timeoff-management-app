variable "region" {
    type        = string
    description = "AWS region"
    default     = "us-east-1"
}

variable "accountId" {
    type        = string
    description = "description"
}

variable "bucket_name" {
  description = "Name of the bucket for terraform state"
  default     = "gorilla-qa-tfstate"
}

variable "bucket_versioning" {
  description = "Versioning feature of s3 bucket"
  default     = "true"
}

variable "dynamodb_table_name" {
  description = "Name of dynamodb table for terraform state"
  default     = "gorilla-qa-tfstate"
}
