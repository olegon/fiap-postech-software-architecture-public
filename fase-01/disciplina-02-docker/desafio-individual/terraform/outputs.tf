output "api_gateway_endpoint" {
  value = aws_api_gateway_stage.latest.invoke_url
}

# these outputs exist just to help you interect with the workload! :)

output "curl_get_programming_languages_command" {
  value = "curl -i -XGET '${aws_api_gateway_stage.latest.invoke_url}/v1/programming-languages'"
}
