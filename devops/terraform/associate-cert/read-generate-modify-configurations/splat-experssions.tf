
provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}

output "names" {
  value = aws_iam_user.lb[*].name
}
