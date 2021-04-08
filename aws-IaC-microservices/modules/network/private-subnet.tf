resource "aws_subnet" "consulteanuvem_voice_subnet_prv_1a"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.0.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sa", var.aws_region)

    tags = {
       "Name" = format("%s-private-1a", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
       "kubernetes.io/role/internal-elb" =  "1"


    }
}

resource "aws_subnet" "consulteanuvem_voice_subnet_prv_1b"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.2.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sb", var.aws_region)

    tags = {
       "Name" = format("%s-private-1b", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
       "kubernetes.io/role/internal-elb" =  "1"


    }
}

resource "aws_subnet" "consulteanuvem_voice_subnet_prv_1c"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.4.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sc", var.aws_region)

    tags = {
       "Name" = format("%s-private-1c", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
       "kubernetes.io/role/internal-elb" =  "1"

    }
}


resource "aws_route_table_association" "private_1a" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_prv_1a.id
    route_table_id = aws_route_table.nat-gw-sre-voice.id

}

resource "aws_route_table_association" "private_1b" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_prv_1b.id
    route_table_id = aws_route_table.nat-gw-sre-voice.id

}

resource "aws_route_table_association" "private_1c" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_prv_1c.id
    route_table_id = aws_route_table.nat-gw-sre-voice.id

}
