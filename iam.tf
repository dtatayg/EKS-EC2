# Create the EKS IAM role and assign the policy for EC2 and EKS services
resource "aws_iam_role" "EKSRole" {
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["eks.amazonaws.com", "ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
# Link the role to the EKS policies for permissions
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.EKSRole.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKSNode" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.EKSRole.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKSService" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.EKSRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSRegistry" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.EKSRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.EKSRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.EKSRole.name
}

