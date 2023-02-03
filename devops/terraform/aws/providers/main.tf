provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

provider "aws" {
  region  = "eu-west-2"
  profile = "louislab"
  alias   = "london"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.46"
    }
  }
}

resource "aws_vpc" "ireland_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "london_vpc" {
  cidr_block = "10.1.0.0/16"
  provider   = aws.london
}
