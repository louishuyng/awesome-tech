provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resurce "aws_iam_user" "lb" {
  name  = "iamuser.${count.index}"
  count = 3
  path  = "/system/"
}

output "name" {
  value = aws_iam_user.lb[*].name
}

output "arn" {
  value = aws_iam_user.lb[*].arn
}

output "combined" {
  value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}
