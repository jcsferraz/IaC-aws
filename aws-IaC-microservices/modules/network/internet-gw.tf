resource "aws_internet_gateway" "gw" {

vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

tags = {
       Name = format("%s-internet-gw", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
    }


}

resource "aws_route_table" "igw-sre-voice" {
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

tags = {
       Name = format("%s-pub-route-gw", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
    }

}

resource "aws_route" "public_internet_access" {
    route_table_id = aws_route_table.igw-sre-voice.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id

}
