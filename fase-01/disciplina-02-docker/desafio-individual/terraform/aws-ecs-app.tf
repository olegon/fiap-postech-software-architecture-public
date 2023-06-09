resource "aws_ecs_task_definition" "app" {
  family                   = "my-app"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.app.arn
  container_definitions = jsonencode([
    {
      name              = "my-app"
      image             = var.app_docker_image
      cpu               = 128
      memoryReservation = 128
      memory            = 256
      essential         = true
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group         = var.app_log_group_name
          awslogs-region        = data.aws_region.current.name
          awslogs-stream-prefix = "logs"
        }
      }
      portMappings = [
        {
          containerPort = var.app_docker_port
        }
      ],
      environment = [
        { "name" : "CUSTOMCONNSTR_ProgrammingLanguageContext", "value" : "Host=${module.db.db_instance_address};Database=postgres;Username=postgres;Password=postgres" }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "my-app"
  cluster         = module.ecs.cluster_arn
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = module.elb.target_group_arns[0]
    container_name   = "my-app"
    container_port   = var.app_docker_port
  }

  network_configuration {
    subnets = module.vpc.private_subnets
    # assign_public_ip = true is required to pull images from docker hub when it on a public subnet
    # docs: https://docs.aws.amazon.com/AmazonECS/latest/userguide/fargate-task-networking.html
    assign_public_ip = false
    security_groups  = [aws_security_group.app.id]
  }
}

resource "aws_iam_role" "app" {
  name               = "my-app-execution-task-role"
  assume_role_policy = data.aws_iam_policy_document.app.json
}

data "aws_iam_policy_document" "app" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "app" {
  role       = aws_iam_role.app.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
