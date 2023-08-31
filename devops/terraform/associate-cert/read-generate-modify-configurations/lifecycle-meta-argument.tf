provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

resource "aws_instance" "myec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }

  lifecycle {
    ignore_changes        = [tags]
    create_before_destroy = true
  }
}

resource "aws_rds_cluster" "myrds" {
  cluster_identifier = "terraform-example"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.07.2"
  database_name      = "mydb"
  master_username    = "root"
  master_password    = "password"

  skip_final_snapshot = true

  lifecycle {
    ignore_changes  = all
    prevent_destroy = true
  }
}
