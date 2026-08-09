output "firehose_role_arn" {
  description = "ARN del rol IAM que firehose va a usar"
  value = aws_iam_role.firehose_role.arn
}

