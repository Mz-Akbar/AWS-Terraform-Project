resource "aws_db_subnet_group" "my_db_subnet_group"{
    name = "my-db-subnet-group"
    subnet_ids =[aws_subnet.Private1.id, aws_subnet.Private2.id]

    tags = {
        Name = "My DB Subnet Group"
    }

}

resource "aws_db_instance" "mydb"  {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.41"
    instance_class = "db.t3.micro"
    db_name = "mydatabase"
    username = var.db_username
    password = var.db_password
    db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    skip_final_snapshot = true
}
        
