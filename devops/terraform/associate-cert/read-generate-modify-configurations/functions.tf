provider "aws" {
  region  = var.region
  profile = "louisdev"
}

locals {
  time = formatdate("YYYYMMDDhhmmss", timestamp())
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  type    = list(string)
  default = ["firstec2", "secondec2"]
}

variable "ami" {
  type = map(string)
  default = {
    "us-east-1"  = "ami-0dc2d3e4c0f9ebd18"
    "us-east-2"  = "ami-0c55b159cbfafe1f0"
    "ap-south-1" = "ami-0c1a7f89451184c8b"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "loginkey"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}

output "timestamp" {
    vaue = local.time
}
