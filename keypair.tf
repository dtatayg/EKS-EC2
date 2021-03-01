#Create the key pair to connect Ec2 instances
resource "aws_key_pair" "demo_key" {
#puttyGen Public Key
  key_name   = "demo_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkqqTEw+cdJsHYN3bJ2KeA+kMgTL5kbcJkqwEBG9SSbbkmbZPmF6A/F4IJMCqf4Cjt+M1SLcOI/3D38BQigfRh7q6krbrj0FPGc2jfatVoYU0UNM/y8u8hFLKPqGyUhrGlpIapuKT6BTHz9wQbDs/xtLf2nDQvIQIe0FRiWHdMblc2VkpumGWXGzMeVaq6tPFHEnauzzMA9S/BaBbxABViqu0qlFnSCRd49b6/HL7wlbdPxpDP3iRZIZKwRlaAsTlOKryxNU/XoBGNvHGlqR4uV2GkGj4N5qvRUYbGtS5KQMFQGB6+w6qsm4psmFasS1V+V9SLgm4F/9UrSb2/tHi/ demo_key"
}