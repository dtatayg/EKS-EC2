
#Security Groups for ingress listening ports
resource "aws_security_group" "demo_sg" {
  name = "allow_https"
  description = "Allow https inbound traffic"
  vpc_id = aws_vpc.demonet.id
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  #Ingress to SSH only from Proxy public IP
    ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["62.87.30.66/32"]
  }
  #Security Groups for egress listening ports
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG for allowing 443"
  }
}