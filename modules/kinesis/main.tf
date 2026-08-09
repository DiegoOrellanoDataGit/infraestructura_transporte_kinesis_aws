resource "aws_kinesis_stream" "kinesis_stream" {
    name = "${var.nombre_proyecto}-${var.environment}-event-steam"
    shard_count = var.shard_count

    stream_mode_details {
      stream_mode = "PROVISIONED"
    }

    encryption_type = "KMS"
    kms_key_id = var.kms_key_id

    tags = {
      Environment = var.environment
      Proyecto = var.nombre_proyecto
    }
}