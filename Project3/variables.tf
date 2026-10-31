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
  default     = "devOps-ec2"
}

variable "vpc_cidr" {
  type        = string
  description = "Defines the CIDR block for the VPC network"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Specifies the name tag for the VPC"
  default     = "devops-vpc"

}

###################################
# Variables for Public Subnet CIDR
###################################

variable "pub_subnet_1" {
  type        = string
  description = "Defines the CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "pub_subnet_2" {
  type        = string
  description = "Defines the CIDR block for the second public subnet"
  default     = "10.0.16.0/24"
}

###################################
# Variables for Public Subnet AZs
###################################

variable "az-1" {
  type        = string
  description = "Specifies the Availability Zone for the first public subnet"
  default     = "ap-southeast-1a"

}

variable "az-2" {
  type        = string
  description = "Specifies the Availability Zone for the second public subnet"
  default     = "ap-southeast-1b"

}

###################################
# Variables for Public Subnet Name
###################################

variable "subnet_name1" {
  type        = string
  description = "Define the name of the first public subnet"
  default     = "public-subnet-1"
}

variable "subnet_name2" {
  type        = string
  description = "Define the name of the second public subnet"
  default     = "public-subnet-2"
}



###################################
# Variables for Private Subnet CIDR
###################################

variable "priv_subnet_1" {
  type        = string
  description = "Defines the CIDR block for the first private subnet"
  default     = "10.0.48.0/24"
}

variable "priv_subnet_2" {
  type        = string
  description = "Defines the CIDR block for the second private subnet"
  default     = "10.0.64.0/24"
}

###################################
# Variables for Private Subnet AZs
###################################

variable "priv-az-1" {
  type        = string
  description = "Specifies the Availability Zone for the first private subnet"
  default     = "ap-southeast-1a"

}

variable "priv-az-2" {
  type        = string
  description = "Specifies the Availability Zone for the second private subnet"
  default     = "ap-southeast-1b"

}

###################################
# Variables for Private Subnet Name
###################################

variable "priv_subnet_name1" {
  type        = string
  description = "Define the name of the first private subnet"
  default     = "private-subnet-1"
}

variable "private_subnet_name2" {
  type        = string
  description = "Define the name of the second public subnet"
  default     = "private-subnet-2"
}


###################################
# Variable for IGW Name
###################################

variable "dev-igw" {
  type        = string
  description = "Defines the name of the Internet Gateway"
  default     = "devops-vpc-igw"
}


#######################################
# Variable for Public Route table Name
#######################################

variable "public_rtb" {
  type        = string
  description = "Defines the name of the Public Route Table"
  default     = "Public-rtb"
}

###################################
# Variable for Elastic IP Name
###################################

variable "elastic_ip" {
  type        = string
  description = "Defines the name of the eip for nat gateway"
  default     = "devops-nat-eip"
}

###################################
# Variable for NAT gateway Name
###################################

variable "nat_gw" {
  type        = string
  description = "Defines the name of the nat gateway"
  default     = "devops-nat-gateway"
}

#######################################
# Variable for Private Route table Name
#######################################

variable "private_rtb" {
  type        = string
  description = "Defines the name of the Public Route Table"
  default     = "Private-rtb"
}