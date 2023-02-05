provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_s3_bucket" "first_bucket" {
  bucket = "louis-first-bucket"
}
