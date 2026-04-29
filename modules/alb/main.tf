## Create an Application Load Balancer (ALB)
resource "aws_lb" "alb" {
  name               = "app-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [var.alb_sg]

  tags = {
    Name = "app-alb"
  }
}

## Create a target group for the ALB
resource "aws_lb_target_group" "tg" {
  name     = "frontend-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    port                = "80"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 3
  }
}
## Register the frontend instance with the target group
resource "aws_lb_target_group_attachment" "frontend_attach" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.frontend_instance_id
  port             = 80
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}