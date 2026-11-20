variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "site_host" {
  description = "Main address of the site (GoDaddy forwards the bare domain here)"
  type        = string
  default     = "www.aravindrajdevops.in"
}

variable "site_bucket_name" {
  type    = string
  default = "aravindrajdevops-site"
}

variable "github_repo" {
  description = "owner/repo allowed to deploy via OIDC"
  type        = string
  default     = "aravindrajsaravanan/portfolio-website"
}

variable "github_repo_with_ids" {
  description = "Same repo in GitHub's immutable-ID subject format (owner@ownerId/repo@repoId), as seen in CloudTrail"
  type        = string
  default     = "aravindrajsaravanan@163525466/portfolio-website@1465122202"
}

variable "create_github_oidc_provider" {
  description = "Set false if the GitHub OIDC provider already exists in this AWS account"
  type        = bool
  default     = true
}
