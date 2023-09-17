resource "aws_security_group" "external-lb-sg" {
 name        = "external-lb-sg"
 vpc_id      = aws_vpc.main.id

ingress {
   from_port   = 3000
   to_port     = 3000
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_alb" "external-lb" {
  name            = "external-lb"
  security_groups = [aws_security_group.external-lb-sg.id]
  subnets         = [aws_subnet.main-public-1a.id, aws_subnet.main-public-1b.id]
  
}

resource "aws_alb_target_group" "external-lb-tg" {
  name     = "external-lb-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/"
    port = 3000
  }
}


resource "aws_alb_listener" "listener_web" {
  load_balancer_arn = aws_alb.external-lb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.external-lb-tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "external-lb-a" {
    target_group_arn = aws_alb_target_group.external-lb-tg.arn
    target_id        = aws_instance.ec2-web-a.id
    port             = 3000
}

resource "aws_lb_target_group_attachment" "external-lb-b" {
    target_group_arn = aws_alb_target_group.external-lb-tg.arn
    target_id        = aws_instance.ec2-web-b.id
    port             = 3000
}
