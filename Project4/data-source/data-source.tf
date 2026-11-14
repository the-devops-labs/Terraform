#########################################
# Data Source To Retrieve Information
#########################################

data "aws_vpc" "my_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "my_subnet" {
  id = var.subnet_id
}


data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}