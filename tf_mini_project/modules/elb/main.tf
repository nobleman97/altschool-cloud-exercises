# resource "aws_elb" "mp-elb" {
#   name               = "mini-proj-elb"
#   availability_zones = ["us-west-2a"]

#   access_logs {
#     bucket        = var.bucket
#     bucket_prefix = "s3://"
#     interval      = 60
#   }

#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   listener {
#     instance_port      = 8000
#     instance_protocol  = "http"
#     lb_port            = 443
#     lb_protocol        = "https"
#     #   = "arn:aws:iam::123456789012:server-certificate/certName"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:8000/"
#     interval            = 30
#   }

#   instances                   = var.instances
#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400

#   tags = {
#     Name = "terraform-elb"
#   }
# }


resource "aws_lb" "mp_alb" {
  name               = "mp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0899d85362ec17809"]
  # subnets            = [for subnet in aws_subnet.public : subnet.id]
  subnets = ["subnet-0e78757205b2ca1c7", "subnet-0336419c4a29b78a3"]

  enable_deletion_protection = true

  # access_logs {
  #   bucket  = var.bucket
  #   prefix  = ""
  #   enabled = true
  # }

  tags = {
    Environment = "dev"
  }
}

resource "aws_lb_target_group" "test" {
  name     = "mp-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-04f1d501c526592c8"

}

resource "aws_alb_target_group_attachment" "test" {
  
  
  count            =  "${length(var.instance_ids)}" # length(var.instance_ids) # == 3 ? 3 : 0
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = "${element(var.instance_ids, count.index)}"
}

# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = aws_lb_target_group.test.arn
#   # target_id        = aws_instance.test.id
#   target_id = var.instances
#   port             = 80

# }