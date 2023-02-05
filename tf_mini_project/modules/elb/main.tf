
resource "aws_lb" "mp_alb" {
  name               = "mp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.instance_sg}"
  subnets = ["subnet-0e78757205b2ca1c7", "subnet-0336419c4a29b78a3"]

  enable_deletion_protection = false



}



resource "aws_lb_target_group" "test" {
  name     = "mp-target-group"
  target_type = "instance"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-04f1d501c526592c8"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}

resource "aws_lb_listener" "Altschool-listener" {
  load_balancer_arn = aws_lb.mp_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
# Create the listener rule
resource "aws_lb_listener_rule" "Altschool-listener-rule" {

  listener_arn = aws_lb_listener.Altschool-listener.arn
  priority     = 1
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
  condition {
    path_pattern {
      values = ["/"]
    }
  }
}



resource "aws_lb_target_group_attachment" "test" {
  
  
  count            =  var.instance_count # "${length(var.instance_ids)}" # length(var.instance_ids) # == 3 ? 3 : 0
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = "${element(var.instance_ids, count.index)}"
  port             = 80
}

