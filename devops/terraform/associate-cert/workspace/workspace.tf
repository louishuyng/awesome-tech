provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0dc2d3e4c0f9ebd18"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}
