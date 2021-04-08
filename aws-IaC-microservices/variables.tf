variable cluster_name {
  default     = "consulteanuvem_voice_cluster_dev"
  description = "cluster kubernetes for consulteanuvem voice development environment"
}

variable aws_region {
  default     = "us-east-1"
  description = " consulteanuvem default region for consulteanuvem voice development environment"
}

variable k8s_version {
  default     = "1.19"
  description = " consulteanuvem default kubernetes version for consulteanuvem voice development environment"
}

variable nodes_instance_sizes {
  default     = [
    "t3.medium"
    ]

  description = "consulteanuvem type nodes for kubernetes consulteanuvem voice development environment"
}

variable auto_scale_options {
  default = { 
      min = 1
      max = 10
      desired = 1
  }
  description = "consulteanuvem auto-scaling for kubernetes consulteanuvem voice development environment"
}