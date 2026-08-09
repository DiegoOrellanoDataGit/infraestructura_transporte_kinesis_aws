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

variable "policy_json" {
  type = string
  description = "Politicas IAM en formato JSON para definir los permisos minimos"
}

