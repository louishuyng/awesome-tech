provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

resource "aws_sqs_queue" "queue" {
  name = "queue"
  lifecycle {
    prevent_destroy = true
  }
}
