resource "aws_api_gateway_vpc_link" "this" {
  name        = "my-vpc-link"
  description = "integrates with my-app-nlb"
  target_arns = [module.elb.lb_arn]
}

resource "aws_api_gateway_rest_api" "this" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "my-app"
      version = "1.0"
    }
    paths = {
      "/v1/programming-languages" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            connectionType       = "VPC_LINK"
            connectionId         = aws_api_gateway_vpc_link.this.id
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "http://${module.elb.lb_dns_name}/v1/programming-languages"
          }
        }
      }
    }
  })

  name = "my-api-gw"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_deployment" "this" {
  rest_api_id = aws_api_gateway_rest_api.this.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.this.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "latest" {
  deployment_id = aws_api_gateway_deployment.this.id
  rest_api_id   = aws_api_gateway_rest_api.this.id
  stage_name    = "latest"
}
