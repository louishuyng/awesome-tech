provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example"
  }
}

