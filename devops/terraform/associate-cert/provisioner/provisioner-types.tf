provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  key_name      = "louisdev"

  provisioner "remote-exec" {
    # Default behavior 
    #if failed it marked resource as tainted
    when = create
    inline = [
      "sudo yum -y install vim",
    ]
    on_failure = continue
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum -y remove vim",
    ]
    on_failure = fail # Default behavior
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/louisdev.pem")
    host        = self.public_ip
  }
}
