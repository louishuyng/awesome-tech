provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "demo" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}
