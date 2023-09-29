output "bucket_name" {
  description = "Bucket name for website hosting"
  value       = aws_s3_bucket.website_bucket.bucket
}

output "s3_website_endpoint" {
  description = "S3 static website hosting endpoint"
  value       = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}