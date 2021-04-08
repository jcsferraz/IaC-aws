resource "aws_subnet" "consulteanuvem_voice_subnet_pub_1a"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.6.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sa", var.aws_region)

    tags = {
       "Name" = format("%s-public-1a", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
       "kubernetes.io/role/elb" =  "1"

    }
}

resource "aws_subnet" "consulteanuvem_voice_subnet_pub_1b"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.8.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sb", var.aws_region)

    tags = {
       "Name" = format("%s-public-1b", var.cluster_name)
       "Environment" = "SRE_VOICE"
       "Squad" = "SRE_VOICE"
       "BU" = "SRE_VOICE"
       "kubernetes.io/cluster/${var.cluster_name}" = "shared"
       "kubernetes.io/role/elb" =  "1"

    }
}

resource "aws_subnet" "consulteanuvem_voice_subnet_pub_1c"{
    vpc_id = aws_vpc.consulteanuvem_voice_vpc_dev.id

    cidr_block                = "14.0.10.0/23"
    map_public_ip_on_launch   = false
    availability_zone         = format("%sc", var.aws_region)

    tags = {
       "Name" = format("%s-public-1c", var.cluster_name)
        "Environment" = "SRE_VOICE"
        "Squad" = "SRE_VOICE"
        "BU" = "SRE_VOICE"
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
        "kubernetes.io/role/elb" =  "1"
        
    }
}


resource "aws_route_table_association" "public_1a" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_pub_1a.id
    route_table_id = aws_route_table.igw-sre-voice.id

}

resource "aws_route_table_association" "public_1b" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_pub_1b.id
    route_table_id = aws_route_table.igw-sre-voice.id

}

resource "aws_route_table_association" "public_1c" {
    subnet_id = aws_subnet.consulteanuvem_voice_subnet_pub_1c.id
    route_table_id = aws_route_table.igw-sre-voice.id

}
