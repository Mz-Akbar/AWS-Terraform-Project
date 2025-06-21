# EC2 Pertama
resource "aws_instance" "ec2_1" { # EC2 Instance
    ami = "ami-09e6f87a47903347c"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Public1.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]  # Menghubungkan SG ke EC2
    key_name = aws_key_pair.genereted_key.key_name           # Menghubungkan KeyPair ke EC2
    associate_public_ip_address = true

    tags = {
        Name = "EC2-1"
    }
}

# EC2 Kedua
resource "aws_instance" "ec2_2" { # EC2 Instance
    ami = "ami-09e6f87a47903347c"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.Public2.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]  # Menghubungkan SG ke EC2
    key_name = aws_key_pair.genereted_key.key_name           # Menghubungkan KeyPair ke EC2
    associate_public_ip_address = true

    tags = {
        Name = "EC2-2"
    }
}








