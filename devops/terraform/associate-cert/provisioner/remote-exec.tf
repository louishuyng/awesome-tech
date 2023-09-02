provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_ec2_instance" "name" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip
    private_key = file("terraform.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}
