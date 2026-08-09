variable "aws_region" {
  type = string
  description = "region geografica"
 default = "us-east-1"
}

variable "nombre_proyecto" {
  type = string
  description = "nombre del proyecto"
  default = "infraestructura-transporte-kinesis-aws"
}

variable "environment" {
  type = string
  description = "nombre del entorno de ddesarrollo"
  default = "dev"
}

variable "s3_bucket_arn" {
  type        = string
  description = "ARN del bucket S3 destino para Firehose"
  default     = "arn:aws:s3:::data-lake-dev"
}


variable "shard_count" {
  type = number
  description = "conteo del shard"
default = 1
}
variable "kms_key_id" {
  type = string
  description = "llave identificadora unica de kms"
 default     = "alias/aws/kinesis" 
 }