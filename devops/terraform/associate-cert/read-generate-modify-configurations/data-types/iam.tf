provider "aws" {
  region  = var.region
  profile = "louisdev"
}

resource "aws_iam_user" "louis" {
  name = var.usernumber
}
