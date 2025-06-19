resource "aws_instance" "MyEC2" {
    ami = "ami-09e6f87a47903347c"
    instance_type = "t2.micro"
    subnet_id = "subnet-0e838cdb2a6d47545"
    key_name = "Server web"
    tags = {
        Name = "Myec2Instacne"
    }
}