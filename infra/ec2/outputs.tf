output "ec2_instance_id" {
  value = aws_instance.technova.id
}

output "elastic_ip" {
  value = aws_eip.technova.public_ip
}

output "ssh_command" {
  value = "ssh -i vockey.pem ec2-user@${aws_eip.technova.public_ip}"
}
