resource "aws_security_group" "sg_for_mp_instances" {
  name        = "instance"
  description = "Allow HTTP traffic"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mini-proj-instances"{
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

  count = var.instance_count

  ami                    = "ami-095413544ce52437d"
  instance_type          = "t2.micro"
  key_name               = "altSchool"
  monitoring             = true
  vpc_security_group_ids = ["${aws_security_group.sg_for_mp_instances.id}"]
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}