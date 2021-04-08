resource "aws_eks_node_group" "consulteanuvem_voice_nodes_cluster_dev"{

   cluster_name = var.eks_cluster.name
   node_group_name = format("%s-ng", var.cluster_name)
   node_role_arn = aws_iam_role.eks_voice_nodes_dev_role.arn

   subnet_ids = [
       var.consulteanuvem_voice_subnet_prv_1a.id,
       var.consulteanuvem_voice_subnet_prv_1b.id,
       var.consulteanuvem_voice_subnet_prv_1c.id
   ]

   instance_types = var.nodes_instance_sizes
 

   scaling_config {
       desired_size = lookup(var.auto_scale_options, "desired")
       max_size = lookup(var.auto_scale_options, "max")
       min_size = lookup(var.auto_scale_options, "min")
   }

    tags = {
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "owned"

    }

}