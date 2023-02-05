provider "aws" {
  region  = "ap-southeast-1"
  profile = "louislab"
}

module "work_queue" {
  source     = "./sqs-with-backoff"
  queue_name = "work-queue"
}

module "thread_queue" {
  source     = "./sqs-with-backoff"
  queue_name = "thread-queue"
}

output "work_queue_name" {
  value = module.work_queue.queue
}

output "work_queue_dead_letter_name" {
  value = module.work_queue.dead_letter_queue
}
