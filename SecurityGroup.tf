resource "aws_security_group" "ec2_sg"{ # Security Group
    name = "ec2-security-group"
    description = "Allow SSH and HTTP"
    vpc_id = aws_vpc.MyVPC.id

    ingress {  # Inbound
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # SSH Terbuka
    }

    ingress { # Inbound
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # HTTP Terbuka
    }

    egress { # Outbound
        from_port = 0
        to_port = 0
        protocol = "1"
        cidr_blocks = ["0.0.0.0/0"] # Semua keluar diperbolehkan
    }
    
    tags = {
        Name = "EC2-SG"
    }
}