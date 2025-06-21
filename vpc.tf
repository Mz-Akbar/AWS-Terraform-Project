resource "aws_vpc" "MyVPC"{
    cidr_block = "10.0.0.0/16"

    tags ={
        Name = "MyVPC"
    }

}

resource "aws_subnet" "Public1" {
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
}
  
resource "aws_subnet" "Public2" {
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"
}
   
resource "aws_subnet" "Private1" {
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"
}
    
resource "aws_subnet" "Private2" {
    vpc_id = aws_vpc.MyVPC.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1b"
}
  
resource "aws_internet_gateway" "Igw"{
    vpc_id = aws_vpc.MyVPC.id
}

resource "aws_route_table" "PublicRoutetable" {
    vpc_id = aws_vpc.MyVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Igw.id
    }
}

resource "aws_route_table_association" "Public1" {
    subnet_id = aws_subnet.Public1.id  
    route_table_id = aws_route_table.PublicRoutetable.id
}

resource "aws_route_table_association" "Public2" {
    subnet_id = aws_subnet.Public2.id
    route_table_id = aws_route_table.PublicRoutetable.id
}

