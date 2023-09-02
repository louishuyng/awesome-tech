provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

import {
  to = "aws_security_group.my_sg"
  id = "sg-0a1b2c3d4e5f6g7h8" # Fake ID 
}
