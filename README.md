# 🚀 Infraestructura de Ingesta con Terraform

## 📘 Descripción
Este proyecto implementa una arquitectura de ingesta de datos en AWS utilizando **Kinesis Data Stream**, **Kinesis Firehose**, **S3** y **CloudWatch Logs**, todo gestionado con **Terraform**.  
Se incluyen módulos reutilizables y entornos separados para **dev** y **prod**.

---

## 🏗️ Arquitectura
```mermaid
flowchart TD
    A[Productores de datos] --> B[Kinesis Data Stream]
    B --> C[Kinesis Firehose]
    C --> D[S3 Bucket Data Lake]
    B --> E[CloudWatch Logs]

├── modules/
│   ├── kinesis/
│   ├── firehose/
│   ├── iam_roles/
│   └── s3_bucket/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── policies/
│   └── firehose.json
└── README.md
