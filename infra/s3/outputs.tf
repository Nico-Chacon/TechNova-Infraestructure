
output "bucket_name" {
  description = "Nombre del bucket creado"
  value       = aws_s3_bucket.technova.bucket
}

output "bucket_url" {
  description = "URL base para los templates en la carpeta cloudformation/"
  value       = "https://s3.amazonaws.com/${aws_s3_bucket.technova.bucket}/cloudformation/"
}

output "bucket_arn" {
  description = "ARN del bucket creado"
  value       = aws_s3_bucket.technova.arn
}
