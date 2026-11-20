terraform {
  required_version = ">= 1.10"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.0" }
  }
  backend "s3" {
    bucket       = "aravindrajdevops-tfstate"
    key          = "portfolio/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}

locals {
  tags = { project = "portfolio-website", environment = "prod", owner = "aravind" }
}

provider "aws" {
  region = var.region
  default_tags { tags = local.tags }
}

# CloudFront only accepts ACM certificates from us-east-1.
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
  default_tags { tags = local.tags }
}
