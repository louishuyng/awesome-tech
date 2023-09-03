provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
  assume_role {
    role_arn     = "arn:aws:iam::${var.account_id}:role/terraform"
    session_name = "louisdev-tf-sts-demo"
  }
}
