# Lambda DynamoDB
resource "aws_lambda_function" "dynamodb" {
	function_name = "dynamodb-reader"
	role = "arn:aws:iam::126189343233:role/LabRole"
	handler = "index.lambda_handler"
	runtime = "python3.11"
	timeout = 10
	filename = "index.zip"
 	source_code_hash = filebase64sha256("index.zip")

	environment {
		variables = {
			DYNAMODB_TABLE = var.DB_TABLE
			
		}
	}
}


resource "aws_lambda_permission" "allow-apigw" {
	statement_id = "AllowExecutionFromApiGateway"
	action = "lambda:InvokeFunction"
	function_name = aws_lambda_function.dynamodb.function_name
	principal = "apigateway.amazonaws.com"
	source_arn = "${aws_apigatewayv2_api.dynamo.execution_arn}/*/*"
}



# Lambda S3
resource "aws_lambda_function" "s3"{
	function_name = "s3-reader"
	role = "arn:aws:iam::126189343233:role/LabRole"
	handler = "S3.lambda_handler"
	runtime = "python3.11"
	timeout = 10
	filename = "S3.zip"
	source_code_hash = filebase64sha256("S3.zip")
}

resource "aws_lambda_permission" "allows3" {
	statement_id = "AllowExecutionFromS3"
	action = "lambda:InvokeFunction"
	function_name = aws_lambda_function.s3.function_name
	principal = "s3.amazonaws.com"
	source_arn = aws_s3_bucket.data.arn
}














