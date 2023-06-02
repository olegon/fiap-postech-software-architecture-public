resource "aws_cloudwatch_log_group" "app" {
  name              = var.app_log_group_name
  retention_in_days = 7
}

resource "aws_cloudwatch_log_group" "api_gw" {
  name              = "my-api-gw"
  retention_in_days = 7
}
