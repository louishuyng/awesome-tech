module "sgmodule" {
  source = "../../modules/sg"
}

resource "aws_instance" "ec2" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.sgmodule.sg_id]
}

output "sg_id" {
  value = module.sgmodule.sg_id
}
