provider "aws" {
  shared_config_files      = "~/.aws/config"      # This is the default
  shared_credentials_files = "~/.aws/credentials" # This is the default
  profile                  = "louisdev"
  region                   = "ap-southeast-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
}

resource "aws_instance" "name" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "first_ec2"
  }
}

resource "aws_iam_user" "demoterrafom" {
  name = "demo-terrafom"
}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {}
