resource "aws_s3_bucket" "static-site"{
    bucket = "static-site-web-2025"

    tags ={
        Name = "Static_website"
    }
}

resource "aws_s3_bucket_website_configuration" "static-site"{
    bucket = aws_s3_bucket.static-site.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

resource "aws_s3_bucket_public_access_block" "static-site"{
    bucket = aws_s3_bucket.static-site.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

data "aws_iam_policy_document" "get_and_put"{
    statement {
        principals {
            type = "AWS"
            identifiers = ["arn:aws:iam::663861047640:user/lks-user"]
        }

        actions = [
            "s3:GetObject",
            "s3:PutObject"
        ]

        resources = [
            aws_s3_bucket.static-site.arn,
            "${aws_s3_bucket.static-site.arn}/*"


        ]
        
    }
}

resource "aws_s3_bucket_policy" "web_policy" {
  bucket = aws_s3_bucket.static-site.id
  policy = data.aws_iam_policy_document.get_and_put.json
}
