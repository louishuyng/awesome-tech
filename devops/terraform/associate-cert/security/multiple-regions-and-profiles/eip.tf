resource "aws_ip" "myeip" {
  vpc = "true"
}

resource "aws_ip" "myeip01" {
  vpc      = "true"
  provider = "aws.louisprd-singapore"
}
