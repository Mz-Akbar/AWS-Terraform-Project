resource "aws_vpc" "MyVPC"{
    cidr_block =  "192.168.0.0/16"

    tags = {
        Name = "MyVPC"
    }
}

resource "aws_subnet" "Public-A"{
    vpc_id  = aws_vpc.MyVPC.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "Public-B"{
    vpc_id  = aws_vpc.MyVPC.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "us-east-1b"
}

resource "aws_subnet" "Private-A"{
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "192.168.10.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "Private-B"{
    vpc_id  = aws_vpc.MyVPC.id
    cidr_block = "192.168.11.0/24"
    availability_zone = "us-east-1b"
} 

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.MyVPC.id
}

resource "aws_route_table" "Rt-public"{
    vpc_id = aws_vpc.MyVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "Public-A"{
    route_table_id = aws_route_table.Rt-public.id
    subnet_id = aws_subnet.Public-A.id
}

resource "aws_route_table_association" "Public-B"{
    route_table_id = aws_route_table.Rt-public.id
    subnet_id = aws_subnet.Public-B.id
}

resource "aws_eip" "eip-nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat-gw"{
    allocation_id = aws_eip.eip-nat.id
    subnet_id = aws_subnet.Public-A.id
}

resource "aws_route_table" "private"{
    vpc_id = aws_vpc.MyVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }
}

resource "aws_route_table_association" "Private-A"{
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.Private-A.id
}

resource "aws_route_table_association" "Private-B" {
    route_table_id = aws_route_table.private.id
    subnet_id = aws_subnet.Private-B.id
}