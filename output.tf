#Some handy info outputs for Ec2
output "instance1" {
  value = [aws_instance.demo-instance1.public_ip, aws_instance.demo-instance1.id]
}
output "instance2" {
  value =  [aws_instance.demo-instance2.public_ip, aws_instance.demo-instance2.id ]
}
output "lbURL" {
  value = aws_lb.LoadBalancer.dns_name
}
#Some handy info outputs for EKS Cluster
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.EKSDemo.endpoint
}
output "eks_cluster_certificate_authority" {
  value = aws_eks_cluster.EKSDemo.certificate_authority
}
