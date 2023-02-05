resource "aws_instance" "mini-proj-instances"{
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

  count = var.instance_count

  ami                    = "ami-095413544ce52437d"
  instance_type          = "t2.micro"
  key_name               = "altSchool"
  monitoring             = true
  vpc_security_group_ids = ["sg-0899d85362ec17809"]
  subnet_id              = "subnet-0e78757205b2ca1c7"
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}