provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_sqs_queue" "queue" {
  name = "${terraform.workspace}-queue"
}
