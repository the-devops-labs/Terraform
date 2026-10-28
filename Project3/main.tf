data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*
  }

  owners = ["099720109477"] # Canonical(official Ubuntu publisher)
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "devop-terraform"
  }
}