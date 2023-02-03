provider "aws" {
    region = "ap-southeast-1"
    profile = "louislab"
}

resource "aws_s3_bucket" "first_bucket" {
    bucket = "louis-bucket-outputs"
}

output "bucket_name" {
    value = aws_s3_bucket.first_bucket.id
}

output "bucket_arn" {
    value = aws_s3_bucket.first_bucket.arn
}

output "bucket_information" {
    value = "bucket name: ${aws_s3_bucket.first_bucket.id}, bucket arn: ${aws_s3_bucket.first_bucket.arn}"
}

output "all" {
  value = aws_s3_bucket.first_bucket
}
