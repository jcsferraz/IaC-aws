module network {
  source = "./modules/network"

   cluster_name = var.cluster_name
   aws_region  = var.aws_region

}

module master {
  source = "./modules/master"

   cluster_name = var.cluster_name
   aws_region  = var.aws_region
   k8s_version = var.k8s_version

   consulteanuvem_voice_vpc_dev = module.network.consulteanuvem_voice_vpc_dev
   consulteanuvem_voice_subnet_prv_1a = module.network.consulteanuvem_voice_subnet_prv_1a
   consulteanuvem_voice_subnet_prv_1b = module.network.consulteanuvem_voice_subnet_prv_1b
   consulteanuvem_voice_subnet_prv_1c = module.network.consulteanuvem_voice_subnet_prv_1c
  
}

module nodes {
  source = "./modules/nodes"

   cluster_name = var.cluster_name
   aws_region  = var.aws_region
   k8s_version = var.k8s_version

   consulteanuvem_voice_vpc_dev = module.network.consulteanuvem_voice_vpc_dev
   consulteanuvem_voice_subnet_prv_1a = module.network.consulteanuvem_voice_subnet_prv_1a
   consulteanuvem_voice_subnet_prv_1b = module.network.consulteanuvem_voice_subnet_prv_1b
   consulteanuvem_voice_subnet_prv_1c = module.network.consulteanuvem_voice_subnet_prv_1c
  
   eks_cluster   = module.master.consulteanuvem_voice_cluster_dev
   eks_cluster_sg = module.master.security_group
   nodes_instance_sizes = var.nodes_instance_sizes
   auto_scale_options = var.auto_scale_options

}
