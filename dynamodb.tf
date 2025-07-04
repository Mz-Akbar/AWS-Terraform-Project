resource "aws_dynamodb_table" "mytable"{
    name = "orders"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "id"


    attribute {
        name = "id"
        type = "S"
    }

    stream_enabled = true
    stream_view_type = "NEW_AND_OLD_IMAGES"
}


resource "aws_dynamodb_kinesis_streaming_destination" "example"{
    stream_arn = aws_kinesis_stream.test_stream.arn
    table_name = aws_dynamodb_table.mytable.name
    approximate_creation_date_time_precision = "MICROSECOND"
}