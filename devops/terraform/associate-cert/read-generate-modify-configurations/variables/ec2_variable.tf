provider "aws" {
  region  = var.region
  profile = "louisdev"
}

resource "aws_instance" "name" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instancetype
}
