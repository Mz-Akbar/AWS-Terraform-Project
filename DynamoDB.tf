resource "aws_dynamodb_table" "basic-dynamodb-table" {
    name = "Music"
    billing_mode = "PROVISIONED"
    read_capacity = 5
    write_capacity = 5
    hash_key = "Artist"
    range_key = "SongTitle"

    attribute {
        name = "Artist"
        type = "S"
    }

    attribute {
        name = "SongTitle"
        type = "S"
    }

    tags = {
        Name = "MusicTable"
        Environment = "Production"
    }
}