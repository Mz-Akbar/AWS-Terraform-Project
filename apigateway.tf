resource "aws_apigatewayv2_api" "dynamo"{
    name = "dynamo-http-api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "dynamo" {
    api_id = aws_apigatewayv2_api.dynamo.id
    integration_type = "AWS_PROXY"
    integration_method = "POST" 
    integration_uri = aws_lambda_function.dynamodb.invoke_arn
}


resource "aws_apigatewayv2_route" "apiroute" {
    api_id = aws_apigatewayv2_api.dynamo.id
    route_key = "GET /data"
    target = "integrations/${aws_apigatewayv2_integration.dynamo.id}"
}

resource "aws_apigatewayv2_deployment" "dynamo" {
  api_id = aws_apigatewayv2_api.dynamo.id

  depends_on = [
    aws_apigatewayv2_route.apiroute
  ]
}

resource "aws_apigatewayv2_stage" "prod" {
    api_id = aws_apigatewayv2_api.dynamo.id
    name = "prod"
    deployment_id = aws_apigatewayv2_deployment.dynamo.id
    auto_deploy = true
}