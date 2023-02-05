provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_sqs_queue" "my_queue" {
  name = "my_queue"
}
