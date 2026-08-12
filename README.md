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

## 🚀 Infraestructura

- **Kinesis Data Stream**
  - 2 shards en modo PROVISIONED.
  - Cifrado con KMS (`alias/aws/kinesis`).
- **Kinesis Firehose Delivery Stream**
  - Fuente: Kinesis Stream.
  - Destino: Bucket S3 con particionado dinámico (`year=...`).
- **S3 Bucket**
  - Almacenamiento de capa Bronze.
- **IAM Roles**
  - Permisos para Kinesis, S3 y CloudWatch.
- **CloudWatch**
  - Alarmas configuradas para throughput de lectura/escritura.

---

## 🔎 Validación

### 1. Stream activo
<img width="1267" height="567" alt="image" src="https://github.com/user-attachments/assets/15c4cb50-6569-41f6-8276-726b13909b59" />


### 2. Firehose entregando a S3
![Firehose activo](screenshots/firehose-active.png)

### 3. Archivos generados en S3
for ($i=1; $i -le 10; $i++) {
>>     aws kinesis put-record `
>>         --stream-name infraestructura-transporte-kinesis-aws-dev-event-stream `
>>         --partition-key "user_$i" `
>>         --data "Test event $i" `
>>         --cli-binary-format raw-in-base64-out `
>>         --region us-east-1
>> }
<img width="632" height="532" alt="image" src="https://github.com/user-attachments/assets/1fa6a891-3415-4a99-99a8-0522e0ce273f" />

### 4. Métricas en CloudWatch
<img width="1535" height="640" alt="image" src="https://github.com/user-attachments/assets/c135d6a5-0e38-4887-bdbc-6fd668d06734" />


---

## 📋 Evidencia de pruebas

- **Terraform Apply**
  ```bash
  Apply complete! Resources: 1 added, 1 changed, 0 destroyed.
Eventos enviados con AWS CLI

powershell
aws kinesis put-record `
    --stream-name infraestructura-transporte-kinesis-aws-dev-event-stream `
    --partition-key "user_1" `
    --data "Test event 1" `
    --cli-binary-format raw-in-base64-out `
    --region us-east-1
Archivos visibles en S3

bash
aws s3 ls s3://infraestructura-transporte-kinesis-aws-dev-bucket/ingesta/
CloudWatch

Métricas IncomingRecords e IncomingBytes confirmadas.


