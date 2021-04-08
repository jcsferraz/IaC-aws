resource "aws_security_group" "control_plane_consulteanuvem_cluster_dev_sg" {


   name = format("%s-control-plane-sg", var.cluster_name)
   vpc_id = var.consulteanuvem_voice_vpc_dev.id

   egress {
       from_port  = 0 
       to_port    = 0

       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
   }
  
    tags = {
         Name = format("%s-control-plane-sg", var.cluster_name)
        "Environment" = "SRE_VOICE"
        "Squad" = "SRE_VOICE"
        "BU" = "SRE_VOICE"
        
       }  

   }

   resource "aws_security_group_rule" "internal_access_consulteanuvem_voice_vpc_dev" {
       cidr_blocks = ["14.0.0.0/16"]
       from_port = 22
       to_port = 22
       protocol = "tcp"
       description = "rule for allow access from internal consulteanuvem_voice_vpc_dev environment"
       
       security_group_id = aws_security_group.control_plane_consulteanuvem_cluster_dev_sg.id
       type = "ingress"
 
   }

   resource "aws_security_group_rule" "internal_access_api_server_consulteanuvem_voice_vpc_dev" {
       cidr_blocks = ["14.0.0.0/16"]
       from_port = 443
       to_port = 443
       protocol = "tcp"
       description = "rule for allow access in the api-server from internal nodes consulteanuvem_voice_vpc_dev environment"
       
       security_group_id = aws_security_group.control_plane_consulteanuvem_cluster_dev_sg.id
       type = "ingress"
 

   }