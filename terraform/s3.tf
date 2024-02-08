
provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

resource "aws_s3_bucket" "terraform_test_mys3bucket" {
  bucket = "terraform-test-bucket"  # Updated bucket name
  acl    = "private"  # Set bucket to private

  # Enable server-side encryption for the bucket
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
