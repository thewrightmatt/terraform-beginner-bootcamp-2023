output "bucket_name" {
  description = "bucket name for our static website hosting"
  value       = module.terrahouse_aws.bucket_name
}

output "cloudfront_url" {
  description = "CF distribution domain name"
  value       = module.terrahouse_aws.cloudfront_url
}