variable "region" {
  type        = string
  description = "aws region where we want to create infra"
  default     = "ap-southeast-1"
}

variable "instance_type" {
  type        = string
  description = "VM type for the web server"
  default     = "t3.micro"
}

variable "tags" {
  type        = string
  description = "tag manage the name of vm"
  default     = "devOps-terraform"
}