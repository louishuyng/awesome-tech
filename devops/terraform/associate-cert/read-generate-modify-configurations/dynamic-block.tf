provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

variable "sg_ports" {
  type        = list(number)
  description = "List of ports to open in the security group"
  default     = [22, 8080, 443, 8300, 9200]

}

resource "aws_security_group" "demo_sg" {
  name = "sample-sg"

  dynamic "ingress" {
    for_each = var.sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
