provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

module "ec2module" {
  source        = "../../modules/ec2"
  instance_type = "t2.small"
}
