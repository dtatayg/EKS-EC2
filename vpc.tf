# Creating Virtual Network
resource "aws_vpc" "demonet" {
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  cidr_block = "172.31.0.0/16"
}
#Creating Subnet in different Availability Zones
resource "aws_subnet" "demo_subnet" {
  availability_zone = "eu-central-1b"
  cidr_block = "172.31.16.0/20"
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.demonet.id
}
  resource "aws_subnet" "demo_subnet2" {
  availability_zone = "eu-central-1c"
  cidr_block = "172.31.8.0/24"
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.demonet.id
}
# creating GTW to permit subnet Wan access
resource "aws_internet_gateway" "gt" {
  vpc_id = aws_vpc.demonet.id
}
# route all external traffic to gateway
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.demonet.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gt.id
  }
}
#assign route table to subnets
resource "aws_route_table_association" "route_association" {
  subnet_id      = aws_subnet.demo_subnet.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "route_association2" {
  subnet_id      = aws_subnet.demo_subnet2.id
  route_table_id = aws_route_table.route.id
}
