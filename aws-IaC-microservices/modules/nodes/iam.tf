data "aws_iam_policy_document" "eks_voice_nodes_dev_role" {

    version = "2012-10-17"

    statement {

        actions = [
            "sts:AssumeRole"
        ]

        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }      
    
    }  

}

resource "aws_iam_role" "eks_voice_nodes_dev_role" {
        name = format("%s-eks_voice_nodes_dev_role", var.cluster_name)
        assume_role_policy = data.aws_iam_policy_document.eks_voice_nodes_dev_role.json

    }

resource "aws_iam_role_policy_attachment" "eks_voice_nodes_dev_role_cluster" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}

resource "aws_iam_role_policy_attachment" "eks_voice_nodes_dev_role_service" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}

resource "aws_iam_role_policy_attachment" "eks_voice_nodes_dev_role_cni" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}

resource "aws_iam_role_policy_attachment" "eks_voice_nodes_dev_role_worker" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}

resource "aws_iam_role_policy_attachment" "eks_voice_nodes_dev_role_agent-gw" {
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}

resource "aws_iam_role_policy_attachment" "eks_voice_dev_role_ecr-read" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks_voice_nodes_dev_role.name
}