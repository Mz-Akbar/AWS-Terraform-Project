#  AWS Infrastructure with Terraform

Repository ini berisi kode Terraform untuk membuat infrastruktur AWS secara otomatis dan terstruktur. Proyek ini ditujukan untuk pembelajaran serta implementasi Infrastructure as Code (IaC) menggunakan Terraform di layanan AWS.

## Layanan yang Digunakan
Beberapa resource AWS yang dapat didefinisikan dalam proyek ini antara lain:

- VPC (Virtual Private Cloud)
- Subnet (Public & Private)
- Internet Gateway & Route Tables
- EC2 Instance
- S3 Bucket
- DynamoDB
- Security Group
- Lambda, API Gateway, dan lain-lain


##  Prasyarat

Sebelum menjalankan project ini, pastikan kamu sudah menginstall:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Akun AWS aktif dan kredensial tersimpan (via `aws configure` atau environment variable)

##  Struktur Folder

```bash
.
├── main.tf           # File utama konfigurasi Terraform
├── variables.tf      # Variabel-variabel yang digunakan
├── outputs.tf        # Output dari resource yang dibuat
├── provider.tf       # Konfigurasi penyedia (provider) AWS
├── README.md         # Dokumentasi proyek
