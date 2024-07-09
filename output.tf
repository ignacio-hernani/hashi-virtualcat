# Outputs file
output "catapp_url" {
  value = "http://${aws_eip.hashicat.public_dns}"
}

output "catapp_ip" {
  value = "http://${aws_eip.hashicat.public_ip}"
}

output "public_key" {
  value     = tls_private_key.hashicat.public_key_openssh
  sensitive = true
}

output "private_key" {
  value     = tls_private_key.hashicat.private_key_pem
  sensitive = true
}
