terraform {
  required_providers {
    aws ={
        source = "Hashicorp/aws"
        version = ">= 4.0"
    }
  }
  required_version = ">= 1.3.8"
}

provider "aws" {
  region = var.aws_region
}
