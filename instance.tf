data "hcp_packer_artifact" "linux-images" {
  bucket_name  = var.packer_bucket_name
  channel_name = "prod"
  platform     = "aws"
  region       = "us-east-2"
}

resource "aws_instance" "hashicat" {
  ami                         = data.hcp_packer_artifact.linux-images.external_identifier
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.hashicat.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.hashicat.id
  vpc_security_group_ids      = [aws_security_group.hashicat.id]

  tags = {
    Name = "${random_string.preffix.result}-hashicat-instance"
  }
}

resource "tls_private_key" "hashicat" {
  algorithm = "ED25519"
}

locals {
  private_key_filename = "${random_string.preffix.result}-ssh-key.pem"
}

resource "aws_key_pair" "hashicat" {
  key_name   = local.private_key_filename
  public_key = tls_private_key.hashicat.public_key_openssh
  # public_key = var.public_key
}
