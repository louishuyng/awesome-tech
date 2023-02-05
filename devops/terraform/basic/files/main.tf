provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_iam_policy" "my_bucket_policy" {
  name   = "list-buckets-policy"
  policy = file("./policy.iam")
}
