locals {
  project_name = "devops-lab"
  environment  = "dev"
  owner        = "Omvir"
  region       = "ap-south-1"
}


locals {
  common_tags = {
    Project     = "devops-lab"
    Environment = "dev"
    Owner       = "Omvir"
  }

  vpc_tags = {
    Name = "devops-vpc"
  }
  igw_tags = {
    Name = "${local.vpc_tags.Name}-igw"
  }
  nat_gw_tags = {
    Name = "devops-nat-gateway"
  }
  eip_tags = {
    Name = "devops-nat-eip"
  }
  web_ebs_tags = {
    Name = "web-ebs"
  }
  web_server_eip = {
    Name = "web-eip"
  }

}


locals {
  ec2_name = {
    app_server = {
      Name = "app-server-ec2"
    }
    web_server = {
      Name = "web-server-ec2"
    }
  }

}



# locals {

#   common_tags = {
#     Project     = local.project_name
#     Environment = local.environment
#     Owner       = local.owner
#     ManagedBy   = "Terraform"

#   }
# }

locals {
  availability_zone = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

locals {
  vpc_full_name        = "${local.project_name}-${local.environment}-vpc"
  web_server_full_name = "${local.project_name}-${local.environment}-web-server"
}


locals {
  base_ebs_size  = 20
  extra_ebs_size = 10

  total_ebs_size = local.base_ebs_size + local.extra_ebs_size
}