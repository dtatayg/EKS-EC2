#creating the 2 Ec2 instances behind the LB
resource "aws_instance" "demo-instance1" {

  ami = "ami-02f9ea74050d6f812"
  instance_type = var.instance_size
  subnet_id = aws_subnet.demo_subnet.id
  vpc_security_group_ids = [ "${aws_security_group.demo_sg.id}" ]
  associate_public_ip_address = true
  key_name = aws_key_pair.demo_key.key_name
  tags = {
    name=var.instance_name
    description="somedemos"
  }
  user_data = <<-EOF
            #!/bin/bash
		    sudo yum -y install httpd -y
		    sudo service httpd start
            chkconfig httpd on
		    echo "Hello VF UC from $(hostname -f)" > /var/www/html/index.html
		    EOF
}

resource "aws_instance" "demo-instance2" {
  ami = "ami-02f9ea74050d6f812"
  instance_type = var.instance_size
  subnet_id = aws_subnet.demo_subnet.id
  vpc_security_group_ids = [ "${aws_security_group.demo_sg.id}" ]
  associate_public_ip_address = true
  key_name = aws_key_pair.demo_key.key_name
  tags = {
    name=var.instance_name
    description="somedemos2"
  }
  user_data = <<-EOF
            #!/bin/bash
		    sudo yum -y install httpd -y
		    sudo service httpd start
            chkconfig httpd on
		    echo "Hello VF UC from $(hostname -f)" > /var/www/html/index.html
		    EOF
}
