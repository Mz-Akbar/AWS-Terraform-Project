resource "aws_s3_bucket" "s3" {
    bucket = "my-tf-s3-bucket-1050"

    tags = {
        Name = "MyBucket"
        Environment = "Dev"
    }
}


resource "aws_s3_bucket" "B" {
    bucket = "my-tf-s3-akbar-2007"

    tags = {
        Name = "bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket" "c" {
    bucket = "my-tf-s3-ppp-210"
    tags = {
        Name = "ember"
        Environment = "Dev"
    }
}