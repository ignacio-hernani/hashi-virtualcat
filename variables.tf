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
