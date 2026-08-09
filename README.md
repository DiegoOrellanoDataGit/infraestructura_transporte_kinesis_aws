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
📂 Estructura del proyecto
Código
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
⚙️ Pasos de despliegue
Inicializar Terraform:

terraform init
terraform plan
terraform apply

✅ Validación funcional
Enviar un evento de prueba:

aws kinesis put-record \
  --stream-name infraestructura-transporte-kinesis-aws-dev-event-stream \
  --partition-key testKey \
  --data "Hello World"
Verificar que el archivo se almacene en el bucket S3.

Revisar logs en CloudWatch para confirmar la entrega.

💡 Optimización de costos
Usar 2 shard en dev para pruebas.

Usar compresión GZIP en Firehose.

Configurar buffering de 5 MB / 60s.

Escalar shard_count en prod según la carga real.
