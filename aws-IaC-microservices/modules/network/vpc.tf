resource "aws_vpc" "consulteanuvem_voice_vpc_dev" {
    cidr_block   = "14.0.0.0/16"
    enable_dns_hostnames = true 
    enable_dns_support = true 

    tags = {
       Name = format("%s-vpc", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
  }
}
