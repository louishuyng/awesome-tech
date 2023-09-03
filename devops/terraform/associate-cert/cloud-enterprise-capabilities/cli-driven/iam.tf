resource "aws_iam_user" "lb" {
  name = "lb"
  path = "/system/"
}
