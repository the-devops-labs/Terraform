resource "aws_instance" "data_source_ec2" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.my_subnet.id

  tags = {
    Name = "data-source-ec2"
  }


}