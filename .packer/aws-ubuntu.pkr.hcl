# Configures a builder plugin and is invoked by the build block, how to connect, what virtualization type, image details etc.
source "amazon-ebs" "ubuntu" {
  ami_name      = "hashicat-image-${md5(timestamp())}"
  instance_type = "t2.small"
  region        = var.region
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

# Build block invokes the source block
build {
  # Publish to HCP Packer
  hcp_packer_registry {
    bucket_name = "linux-images"
    description = <<EOT
      Metadata hosted by HCP Packer, image hosted by AWS
    EOT
    bucket_labels = {
      "owner"          = "platform-team"
      "os"             = "Ubuntu",
      "ubuntu-version" = "Jammy 22.04",
    }

    build_labels = {
      "build-time"   = timestamp()
      "build-source" = basename(path.cwd)
    }
  }

  name = "packer-ubuntu-aws"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  # Configures the image, e.g. install software
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Installing Redis",
      "sleep 30",
      "touch dan.txt",
    ]
  }
}
