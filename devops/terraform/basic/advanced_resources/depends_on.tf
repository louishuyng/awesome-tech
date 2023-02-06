provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

# The aws_iam_role_policy.policy is specified as a dependency of the instance. 
# This could be because the instance will use the role as part of booting up and the role needs to give the instance access to all of S3.
resource "aws_iam_role_policy" "policy" {
  name = "policy"
  role = "role"
  policy = jsonencode({
    "Statement" = [{
      "Action" = "s3:*",
      "Effect" = "Allow",
    }],
  })
}

resource "aws_instance" "example" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
  depends_on = [
    aws_iam_role_policy.policy,
  ]
}
