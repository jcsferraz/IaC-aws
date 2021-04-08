resource "aws_eks_cluster" "consulteanuvem_voice_cluster_dev" {

name = var.cluster_name
version = var.k8s_version
role_arn = aws_iam_role.eks_voice_dev_role.arn

vpc_config {
    security_group_ids = [
      aws_security_group.control_plane_consulteanuvem_cluster_dev_sg.id
    ]
        
    subnet_ids = [
        var.consulteanuvem_voice_subnet_prv_1a.id,
        var.consulteanuvem_voice_subnet_prv_1b.id,
        var.consulteanuvem_voice_subnet_prv_1c.id
    ]
    
    
    }


    tags = {

        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
        "Environment" = "SRE_VOICE"
        "Squad" = "SRE_VOICE"
        "BU" = "SRE_VOICE"
        }
}
