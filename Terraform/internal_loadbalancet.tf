
resource "aws_security_group" "inter-lb-app-sg" {
 name        = "inter-lb-app-sg"
 vpc_id      = aws_vpc.main.id

ingress {
   from_port   = 5000
   to_port     = 5000
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

resource "aws_alb" "inter-lb-app" {
  name            = "inter-lb-app"
  security_groups = [aws_security_group.inter-lb-app-sg.id]
  subnets         = [aws_subnet.main-private-1a.id, aws_subnet.main-private-1b.id]
  
}

resource "aws_alb_target_group" "inter-lb-app-tg" {
  name     = "inter-lb-app-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  stickiness {
    type = "lb_cookie"
  }
  health_check {
    path = "/get"
    port = 5000
  }
}


resource "aws_alb_listener" "listener_app" {
  load_balancer_arn = aws_alb.inter-lb-app.arn
  port              = "5000"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.inter-lb-app-tg.arn
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "internal-lb-a" {
    target_group_arn = aws_alb_target_group.inter-lb-app-tg.arn
    target_id        = aws_instance.ec2-app-a.id
    port             = 5000
}

resource "aws_lb_target_group_attachment" "internal-lb-b" {
    target_group_arn = aws_alb_target_group.inter-lb-app-tg.arn
    target_id        = aws_instance.ec2-app-b.id
    port             = 5000
}
