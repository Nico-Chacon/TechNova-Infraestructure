output "elastic_ip" {
  value = module.ec2.elastic_ip
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "rds_port" {
  value = module.rds.rds_port
}

output "rds_identifier" {
  value = module.rds.rds_identifier
}

output "ec2_instance_id" {
  value = module.ec2.ec2_instance_id
}

output "ssh_command" {
  value = module.ec2.ssh_command
}

