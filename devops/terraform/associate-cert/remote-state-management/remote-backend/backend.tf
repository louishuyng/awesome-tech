terraform {
  backend "s3" {
    bucket         = "louisdev-terraform"
    key            = "network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
  }
}
