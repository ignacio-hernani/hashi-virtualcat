resource "aws_security_group" "hashicat" {
  name = "${random_string.preffix.result}-security-group"

  vpc_id = aws_vpc.hashicat.id

  ingress { # SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidrs
  }

  ingress { # HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidrs
  }

  ingress { # HTTPS
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ingress_cidrs
  }

  egress { # all-out
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.allowed_egress_cidrs
    prefix_list_ids = []
  }

  tags = {
    Name = "${random_string.preffix.result}-security-group"
  }
}
