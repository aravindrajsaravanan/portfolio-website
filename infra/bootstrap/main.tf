# One-time setup: creates the S3 bucket that stores Terraform state for infra/.
# Uses local state on purpose (the state bucket can't store its own state).
terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.0" }
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = { project = "portfolio-website", environment = "prod", owner = "aravind" }
  }
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "aravindrajdevops-tfstate"
  lifecycle { prevent_destroy = true }
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration { status = "Enabled" }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket                  = aws_s3_bucket.tfstate.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "state_bucket" { value = aws_s3_bucket.tfstate.bucket }
