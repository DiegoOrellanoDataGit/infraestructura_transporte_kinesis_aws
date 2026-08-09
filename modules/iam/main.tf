resource "aws_iam_role" "firehose_role" {
  name = "${var.nombre_proyecto}-${var.environment}-firehose-role"

  assume_role_policy = jsonencode(
    {

        Version= "2012-10-17"
        Statement = [{
            Effect = "Allow",
            Principal = {
                Service = "firehose.amazonaws.com"
            },
            Action = "sts:AssumeRole"
        }]
    }
  )
}

resource "aws_iam_role_policy" "firehose_policy" {
  role = aws_iam_role.firehose_role.id
  policy = var.policy_json
}