provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_iam_user" "iam" {
  for_each = toset(["louis", "louis2", "louis3"])
  name     = each.key
}

resource "aws_instance" "myec2" {
  ami = "ami-0c55b159cbfafe1f0"
  for_each = {
    key1 = "t2.micro"
    key2 = "t2.small"
  }
  instance_type = each.value
  key_name      = each.key
  tags = {
    Name = each.value
  }
}
