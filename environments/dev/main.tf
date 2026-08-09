module "iam_roles" {
  source = "../../modules/iam"
  environment = var.environment
  policy_json = file("../../policies/firehose.json")
}

module "kinesis" {
  source = "../../modules/kinesis"
  environment = var.environment
  shard_count = var.shard_count
  kms_key_id = var.kms_key_id
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"
  environment = var.environment
  nombre_proyecto = var.nombre_proyecto
}

module "firehose" {
  source = "../../modules/firehose"
  environment = var.environment
  event_stream_arn = module.kinesis.event_stream_arn
  firehose_role_arn = module.iam_roles.firehose_role_arn
  s3_bucket_arn = var.s3_bucket_arn

}