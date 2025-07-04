resource "aws_s3_bucket" "data"{
    bucket = "lambda-input-analytics-dev-2f8a9c37"
}

resource "aws_s3_bucket_public_access_block" "public"{
    bucket = aws_s3_bucket.data.id
    block_public_acls = true 
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "bucket-policy"{
    bucket = aws_s3_bucket.data.id
    policy = data.aws_iam_policy_document.s3-policy.json
}


resource "aws_s3_bucket_lifecycle_configuration" "lifecycle"{
	bucket = aws_s3_bucket.data.id
	
	rule {
		id = "aturan-1"
		status = "Enabled"
		
		filter {
			prefix = "logs/"
		}
		
		expiration {
			days = 1
		}
	}
}

resource "aws_s3_bucket_notification" "trigger_lambda" {
  bucket = aws_s3_bucket.data.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.s3.arn
    events = ["s3:ObjectCreated:*"]
    filter_prefix = "uploads/"   
    filter_suffix = ".txt"   
  }

  depends_on = [aws_lambda_permission.allows3]
}
