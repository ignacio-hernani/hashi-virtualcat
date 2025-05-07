variable "instance_type" {
  description = "Specifies the AWS instance type."
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "Specifies the AWS region."
  type        = string
  default     = "us-west-2"
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
  default     = ["80.26.0.0/16"] # <-- change for snyk
}

variable "allowed_egress_cidrs" {
  type        = list(string)
  description = "CIDRs the instance is allowed to talk to"
  default     = ["10.0.0.0/16"] # <-- change for snyk
}

variable "cidr" {
  type        = string
  description = "CIDR block to associate with the VPC"
  default     = "10.0.0.0/16"
}

variable "hashicat_subnet" {
  type        = string
  description = "hashicat public subnet"
  default     = "10.0.10.0/24"
}

variable "static_subnet" {
  type        = string
  description = "static assets public subnet"
  default     = "10.0.100.0/24"
}

variable "route" {
  type        = string
  description = "CIDR block for the route table"
  default     = "0.0.0.0/0"
}
