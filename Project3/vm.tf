data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*
  }

  owners = ["099720109477"] # Canonical(official Ubuntu publisher)
}

#######################################
# App server EC2 
#######################################


resource "aws_instance" "app_server_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.app_instance_type
  subnet_id     = aws_subnet.private_subnet_1.id

  tags = {
    Name = var.aap_instance_name
  }
}

#######################################
# Web server EC2 
#######################################


resource "aws_instance" "web_server_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.web_instance_type
  subnet_id     = aws_subnet.public_subnet_1.id

  ## Explicitly assigns a public IPv4 address to this EC2 instance
  #associate_public_ip_address = true    ##Best when we want to control public IP assignment for a specific instance 


  tags = {
    Name = var.web_instance_name
  }
}



#######################################
# Elastic IP address for Public EC2 
#######################################
#This resource block creates a new eip

resource "aws_eip" "web_server_1_ip" {
  domain = "vpc"

  tags = {
    Name = var.web_server_eip
  }

}

#This resource block assign the eip to ec2
resource "aws_eip_association" "eip_associate" {
  instance_id   = aws_instance.web_server_1.id
  allocation_id = aws_eip.web_server_1_ip.id
}



#######################################
# EBS Volume for Public EC2 
#######################################

resource "aws_ebs_volume" "ebs_web" {
  availability_zone = var.az-1
  size              = var.ebs_size
  encrypted         = var.ebs_encrypted
  type              = var.ebs_type
  iops              = var.ebs_iops
  throughput        = var.ebs_throughput

  tags = {
    Name = var.ebs_volume
  }
}


#######################################
# EBS Volume attachment to Ec2
#######################################

resource "aws_volume_attachment" "web_vol_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_web.id
  instance_id = aws_instance.web_server_1.id
}