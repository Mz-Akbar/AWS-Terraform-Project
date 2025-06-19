resource "aws_db_instance" "mydbinstance" {
    engine = "mysql"
    instance_class = "db.t3.micro"
    engine_version = "8.0.41"
    allocated_storage = 20
    storage_type = "gp2"
    identifier = "myrds"
    username = "admin"
    password = "password123"
    skip_final_snapshot = true
    db_name = "mydbs"

    tags = {
        Name = "MyRDSInstance"

    }
}  