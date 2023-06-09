module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 5.9"

  identifier = "my-db"

  engine               = "postgres"
  engine_version       = "14"
  family               = "postgres14"
  major_engine_version = "14"
  instance_class       = "db.t4g.micro"

  allocated_storage     = 5
  max_allocated_storage = 10

  db_name = "postgres"
  port    = "5432"

  # Sorry for that... Just a demo!
  username                            = "postgres"
  create_random_password              = false
  password                            = "postgres"
  iam_database_authentication_enabled = false
  skip_final_snapshot                 = true

  vpc_security_group_ids = [aws_security_group.db.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
  create_monitoring_role = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets

  # Database Deletion Protection
  deletion_protection = false

  parameters = [
    {
      name  = "autovacuum"
      value = 1
    },
    {
      name  = "client_encoding"
      value = "utf8"
    }
  ]
}