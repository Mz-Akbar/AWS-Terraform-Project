resource "aws_glue_catalog_database" "glue" {
    name = "mycatalogdb"
}

resource "aws_glue_crawler" "crawler" {
    database_name = aws_glue_catalog_database.glue.name
    name = "my-crawler"
    role = "arn:aws:iam::126189343233:role/LabRole"
    table_prefix = "id-"
    s3_target {
        path  = "s3://${aws_s3_bucket.data.bucket}"
    }
}

