variable "instance_type" {
  description = "Specifies the AWS instance type."
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "Specifies the AWS region."
  type        = string
  default     = "us-east-2"
}

variable "packer_bucket_name" {
  description = "Specifies the Packer bucket name."
  type        = string
  default     = "linux-images"
}

variable "packer_channel_name" {
  description = "Specifies the Packer channel name."
  type        = string
  default     = "cat-channel"
}

variable "allowed_ingress_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the instance (e.g. your office VPN)"
  default     = ["192.168.0.0/24"] # <-- change
}

variable "allowed_egress_cidrs" {
  type        = list(string)
  description = "CIDRs the instance is allowed to talk to"
  default     = ["10.0.0.0/16"] # <-- change
}
