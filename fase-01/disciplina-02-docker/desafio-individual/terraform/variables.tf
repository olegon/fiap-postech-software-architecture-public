variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "app_log_group_name" {
  type    = string
  default = "my-app"
}

variable "app_docker_image" {
  type    = string
  default = "olegon/fiap-soat-docker-dotnet-challenge:latest"
}

variable "app_docker_port" {
  type    = number
  default = 5000
}
