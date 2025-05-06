# Outputs file

output "first_create_key" {
  description = "First, create a private key file from the generated private key, you need to remove the backslash before the first double quote and the last double quote"
  value       = "printf \"${tls_private_key.hashicat.private_key_openssh}\" > ./private_key.pem"
  sensitive   = true
}

output "second_permissions" {
  description = "Second, set the correct permissions on the private key file"
  value       = "chmod 600 ./private_key.pem"
}

output "third_ssh_command" {
  description = "Third, use the following command to SSH into the instance."
  value       = "ssh -i ./private_key.pem ubuntu@${aws_eip.hashicat.public_dns}"
}
