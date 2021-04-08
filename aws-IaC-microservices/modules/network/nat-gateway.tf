resource "aws_eip" "nat-gw-out-eip-consulteanuvem-voice" {
vpc = true

tags = {
   Name = format("%s-eip", var.cluster_name)
   "Environment" = "SRE_VOICE"
   "Squad" = "SRE_VOICE"
   "BU" = "SRE_VOICE"

}

}

resource "aws_nat_gateway" "nat-gw-sre-voice" {

 allocation_id = aws_eip.nat-gw-out-eip-consulteanuvem-voice.id
 subnet_id = aws_subnet.consulteanuvem_voice_subnet_pub_1a.id

 tags = {
   Name = format("%s-nat-gateway", var.cluster_name)
   "Environment" = "SRE_VOICE"
   "Squad" = "SRE_VOICE"
   "BU" = "SRE_VOICE"
  
   }

}

resource "aws_route_table" "nat-gw-sre-voice"{

vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

tags = {
   Name = format("%s-prv-route-gw", var.cluster_name)
   "Environment" = "SRE_VOICE"
   "Squad" = "SRE_VOICE"
   "BU" = "SRE_VOICE"

   }

}

resource "aws_route" "private_internet_access" {
    route_table_id = aws_route_table.nat-gw-sre-voice.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw-sre-voice.id

}
