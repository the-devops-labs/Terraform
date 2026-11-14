variable "aws_region" {
  type        = string
  description = "aws region where we want to create infra"
  default     = "ap-south-1"
}


variable "vpc_id" {
  type        = string
  description = "Retrieve the ID of the existing VPC"
  default     = "vpc-07e324fdcdb53e5e7"

}

variable "subnet_id" {
  type        = string
  description = "Retrieve the ID of the existing subnet"
  default     = "subnet-00faa70f42f405ef4"

}