data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "louisdev-terraform"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
