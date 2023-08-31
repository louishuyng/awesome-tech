provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_instance" "instance-1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  count         = 3
}

resource "aws_iam_user" "lb" {
  name  = var.elb_names[count.index]
  count = 5
}


variable "elb_names" {
  type    = list(string)
  default = ["dev-elb", "stg-elb", "prod-elb"]
}
