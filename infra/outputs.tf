output "acm_validation_record" {
  description = "Add this CNAME in GoDaddy to validate the certificate"
  value = [for o in aws_acm_certificate.site.domain_validation_options : {
    type  = o.resource_record_type
    name  = o.resource_record_name
    value = o.resource_record_value
  }]
}

output "cloudfront_domain_name" {
  description = "Point the www CNAME in GoDaddy to this"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_distribution_id" { value = aws_cloudfront_distribution.site.id }
output "s3_bucket" { value = aws_s3_bucket.site.bucket }
output "github_deploy_role_arn" { value = aws_iam_role.github_deploy.arn }
