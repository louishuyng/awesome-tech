provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

locals {
  common_tags = {
    Owner       = "DevOps Team"
    Environment = "backend"
  }
}

resource "aws_instawnce" "app-dev" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_instance" "db-dev" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags          = local.common_tags
}

resource "aws_ebs_volume" "db-ebs" {
  availability_zone = "us-east-1a"
  size              = 8
  tags              = local.common_tags
}
