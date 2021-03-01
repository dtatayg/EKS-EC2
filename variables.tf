# Variables for naming and size
variable "instance_name" {
  description = "instance name"
  type = string
  default = "DemoInstance"
}
variable "instance_size" {
  default = "t2.micro"
}
