#creating LoadBalancer
resource "aws_lb" "LoadBalancer" {
  name = "LoadBalancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.demo_sg.id]
  subnets = [aws_subnet.demo_subnet.id, aws_subnet.demo_subnet2.id ]
}
# Creating Target for the LoadBalancer
resource "aws_alb_target_group" "Target" {
  name = "TG"
  port =80
  protocol = "HTTP"
  vpc_id = aws_vpc.demonet.id
}
# Which instances will be behind LoadBalancer
resource "aws_alb_target_group_attachment" "Instances_Alb" {
  target_group_arn = aws_alb_target_group.Target.arn
  target_id = aws_instance.demo-instance2.id
}

resource "aws_alb_target_group_attachment" "Instances_Alb2" {
  target_group_arn = aws_alb_target_group.Target.arn
  target_id = aws_instance.demo-instance1.id
}

#Port Listening
resource "aws_alb_listener" "Listener" {
  load_balancer_arn = aws_lb.LoadBalancer.arn
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.Target.arn
  }
}