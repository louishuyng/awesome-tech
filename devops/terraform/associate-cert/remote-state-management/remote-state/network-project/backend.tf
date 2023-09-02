terraform {
  backend "s3" {
    bucket = "louisdev-terraform"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
