#creating EKS cluster

resource "aws_eks_cluster" "EKSDemo" {
  name = "DemoCluster"
  role_arn = aws_iam_role.EKSRole.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.demo_subnet.id,
      aws_subnet.demo_subnet2.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSService,
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_alb_listener.Listener
  ]
}
#Creating EKS Node Group and the desired instances inside the group
resource "aws_eks_node_group" "eksnode" {
  cluster_name =  aws_eks_cluster.EKSDemo.name
  node_group_name = "eksnode"
  node_role_arn = aws_iam_role.EKSRole.arn
  instance_types = ["t2.micro"]
  subnet_ids = [
      aws_subnet.demo_subnet.id,
      aws_subnet.demo_subnet2.id]
  scaling_config {
    desired_size = 2
    max_size = 2
    min_size = 2
  }
    depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
      ]
}