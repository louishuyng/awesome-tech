// Return the specific field of the resource
output "queue_arn" {
  value = aws_sqs_queue.sqs.arn
}

output "queue_name" {
  value = aws_sqs_queue.sqs.name
}

output "dead_letter_queue_arn" {
  value = aws_sqs_queue.sqs_dead_letter.arn
}

output "dead_letter_queue_name" {
  value = aws_sqs_queue.sqs_dead_letter.name
}

// Return all of the fields of the resource 
output "queue" {
  value = aws_sqs_queue.sqs
}

output "dead_letter_queue" {
  value = aws_sqs_queue.sqs_dead_letter
}
