terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}