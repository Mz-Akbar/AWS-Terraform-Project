data "aws_iam_policy_document" "s3-policy"{
    statement {
        principals {
            type = "AWS"
            identifiers = ["arn:aws:sts::126189343233:assumed-role/voclabs/user4187737=119042-43"]
        }

        actions = [
            "s3:GetObject",
        ]

        resources = [
            "${aws_s3_bucket.data.arn}/*"
        ]
    }
}

