#################################
# VPC & it's Components
#################################

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr ## Reference a variable: var.<variable_name>
  instance_tenancy = "default"

  tags = merge(local.common_tags, local.vpc_tags)

}

#################################
# Public  Subnet
#################################

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id ## Reference a resource attribute: <resource_type>.<resource_name>.<attribute>
  cidr_block              = var.pub_subnet_1
  availability_zone       = var.az_1
  map_public_ip_on_launch = true ## Automatically assigns public IPv4 addresses to instances launched in this subnet by default. 

  tags = {
    Name = var.subnet_name1
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id ## Reference a resource attribute: <resource_type>.<resource_name>.<attribute>
  cidr_block              = var.pub_subnet_2
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name2
  }
}


#################################
# Private  Subnet
#################################

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv_subnet_1
  availability_zone = var.priv_az_1

  tags = {
    Name = var.priv_subnet_name1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv_subnet_2
  availability_zone = var.priv_az_2

  tags = {
    Name = var.private_subnet_name2
  }
}

#################################
# Internet Gateway
#################################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.common_tags, local.igw_tags)
}

#################################
# Public Route Table
#################################

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.public_rtb
  }
}

###################################################
# Attach Public Subnets to the Public Route Table
###################################################

resource "aws_route_table_association" "associate_public_subnet_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "associate_public_subnet_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id

}

###################################
# Elastic IP for NAT Gateway
###################################

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = merge(local.common_tags, local.eip_tags)
}
#################################
# NAT Gateway
#################################

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = merge(local.common_tags, local.nat_gw_tags)
}


#################################
# Private Route Table
#################################

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = var.private_rtb
  }

}

####################################################
# Attach Private Subnets to the Private Route Table
####################################################

resource "aws_route_table_association" "associate_private_subnet_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "associate_private_subnet_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}