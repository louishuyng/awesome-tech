provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

data "aws_s3_bucket" "bucket" {
  bucket = "bucket-already-exists"
}

resource "aws_iam_policy" "my_bucket_policy" {
  name = "my-bucket-policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "${data.aws_s3_bucket.bucket.arn}"
            ]
        }
    ]
}
EOF
}
