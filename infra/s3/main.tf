# ──────────────────────────────────────────────
# Bucket S3 TechNova
# ──────────────────────────────────────────────
resource "aws_s3_bucket" "technova" {
  bucket = var.bucket_name

  tags = {
    Name     = var.bucket_name
    Proyecto = "TechNova"
  }
}

# Configuración de acceso público (equivalente a PublicAccessBlockConfiguration)
resource "aws_s3_bucket_public_access_block" "technova" {
  bucket                  = aws_s3_bucket.technova.id
  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

# ──────────────────────────────────────────────
# Bucket Policy (acceso público solo a carpeta cloudformation/)
# ──────────────────────────────────────────────
resource "aws_s3_bucket_policy" "technova" {
  bucket = aws_s3_bucket.technova.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowMyAccountOnly"
        Effect    = "Allow"
        Principal = {
          AWS = "arn:aws:iam::575792876123:root"
        }
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::technova-cloudformation-templates-chacon/cloudformation/*"
      }
    ]
  })
}



