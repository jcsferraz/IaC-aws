output "consulteanuvem_voice_cluster_dev" {
  value       = aws_eks_cluster.consulteanuvem_voice_cluster_dev
  description = "description"
}

output "security_group" {
   value       = aws_security_group.control_plane_consulteanuvem_cluster_dev_sg
   description = "description"
}
