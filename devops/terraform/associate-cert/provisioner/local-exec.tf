provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_ec2_instance" "myec2" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  provisioner "local-exec" {
    command = "echo ${aws_ec2_instance.myec2.private_ip} > private_ips.txt"
  }
}
