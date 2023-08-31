provider "aws" {
  region  = var.region
  profile = "louisdev"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.types[var.region]
}

resource "aws_instance" "myec2-list" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.list[0]
}

variable "list" {
  type    = list(string)
  default = ["t2.micro", "t2.nano", "t2.small"]
}

variable "types" {
  type = map(string)
  default = {
    us-east-1 = "t2.micro"
    us-east-2 = "t2.nano"
    us-west-1 = "t2.small"
  }
}
