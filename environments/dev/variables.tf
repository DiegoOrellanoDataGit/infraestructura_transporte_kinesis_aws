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
default = 2
}
variable "kms_key_id" {
  type = string
  description = "llave identificadora unica de kms"
 default     = "alias/aws/kinesis" 
 }
 
variable "buffering_size" {
  type = number
  description = "Tamaño del buffer medido en MB antes de entregar a S3"
  default = 5
}

variable "buffering_interval" {
  type = number
  description = "Intervalo de tiempo medido en segundos para entrega datos a S3"
  default = 60
}