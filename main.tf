# DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name = var.aws_db_subnet_group_name
  # name_prefix
  description = "Shared RDS DB Subnet Group"
  subnet_ids  = [var.aws_db_subnet_group_subnet1_id, var.aws_db_subnet_group_subnet2_id]

  # Tagging
  tags = {
    Name           = var.aws_db_subnet_group_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# DB Security Group
resource "aws_security_group" "this" {
  name = var.aws_security_group_name
  # name_prefix
  description = "Shared RDS DB Security Group"

  ingress {
    description = "Allow ingress traffic from the follwoing CIDR blocks"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # revoke_rules_on_delete = false

  vpc_id = var.aws_security_group_vpc_id

  # Tagging
  tags = {
    Name           = var.aws_security_group_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# RDS Database
resource "aws_db_instance" "this" {
  allocated_storage           = var.aws_db_instance_allocated_storage
  allow_major_version_upgrade = true
  apply_immediately           = false
  auto_minor_version_upgrade  = true
  availability_zone           = var.aws_db_instance_availability_zone
  backup_retention_period     = var.aws_db_instance_backup_retention_period
  backup_window               = var.aws_db_instance_backup_window
  ca_cert_identifier          = var.aws_db_instance_ca_cert_identifier
  # character_set_name
  copy_tags_to_snapshot    = true
  db_subnet_group_name     = aws_db_subnet_group.this.name
  delete_automated_backups = true
  deletion_protection      = false
  # domain
  # domain_iam_role_name
  enabled_cloudwatch_logs_exports = ["error", "general", "slowquery"]
  engine                          = var.aws_db_instance_engine
  engine_version                  = var.aws_db_instance_engine_version
  # final_snapshot_identifier         = ""
  iam_database_authentication_enabled = true
  identifier                          = var.aws_db_instance_identifier
  # identifier_prefix
  instance_class = var.aws_db_instance_instance_class
  # iops
  # kms_key_id
  # license_model
  maintenance_window    = var.aws_db_instance_maintenance_window
  max_allocated_storage = var.aws_db_instance_max_allocated_storage
  monitoring_interval   = 0
  # monitoring_role_arn
  multi_az = false
  name     = var.aws_db_instance_name
  # option_group_name
  parameter_group_name         = var.aws_db_instance_parameter_group_name
  password                     = var.aws_db_instance_password
  performance_insights_enabled = false
  # performance_insights_kms_key_id
  # performance_insights_retention_period = 8
  port                = var.aws_db_instance_port
  publicly_accessible = false
  # replicate_source_db
  # restore_to_point_in_time
  # s3_import
  # security_group_names
  skip_final_snapshot = true
  # snapshot_identifier
  storage_encrypted = false
  storage_type      = var.aws_db_instance_storage_type

  # Tagging
  tags = {
    Name           = var.aws_db_instance_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }

  # timezone
  username               = var.aws_db_instance_username
  vpc_security_group_ids = [aws_security_group.this.id]
}

# Secrets Manager
resource "aws_secretsmanager_secret" "this" {
  name = var.aws_secretsmanager_secret_name
  # description
  # kms_key_id
  # policy
  # recovery_window_in_days

  tags = {
    Name           = var.aws_secretsmanager_secret_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# IAM Role
resource "aws_iam_role" "this" {
  name = var.rds_service_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "rds.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Role Policy
resource "aws_iam_role_policy" "this" {
  name = var.rds_service_role_policy_name
  role = aws_iam_role.this.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
              "secretsmanager:GetResourcePolicy",
              "secretsmanager:GetSecretValue",
              "secretsmanager:DescribeSecret",
              "secretsmanager:ListSecretVersionIds"
              ],
            "Resource": ["${aws_secretsmanager_secret.this.arn}"],
            "Effect": "Allow"
        },
        {
            "Action": [
              "secretsmanager:GetRandomPassword",
              "secretsmanager:ListSecrets"
              ],
            "Resource": "*",
            "Effect": "Allow"
        }
    ]
}
EOF
}

# RDS Proxy
resource "aws_db_proxy" "this" {
  name = var.aws_db_proxy_name

  auth {
    auth_scheme = "SECRETS"
    description = "example"
    iam_auth    = "DISABLED"
    secret_arn  = aws_secretsmanager_secret.this.arn
    # username
  }

  debug_logging          = false
  engine_family          = "MYSQL"
  idle_client_timeout    = 1800
  require_tls            = true
  role_arn               = aws_iam_role.this.arn
  vpc_security_group_ids = [aws_security_group.this.id]
  vpc_subnet_ids         = [var.aws_db_subnet_group_subnet1_id, var.aws_db_subnet_group_subnet2_id]

  tags = {
    Name           = var.aws_db_proxy_name
    Namespace      = var.namespace
    BoundedContext = var.bounded_context
    Environment    = var.environment
  }
}

# RDS Proxy Default Target Group
resource "aws_db_proxy_default_target_group" "this" {
  db_proxy_name = aws_db_proxy.this.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    init_query                   = "SET x=1, y=2"
    max_connections_percent      = 100
    max_idle_connections_percent = 50
    session_pinning_filters      = ["EXCLUDE_VARIABLE_SETS"]
  }
}

# RDS Proxy Target
resource "aws_db_proxy_target" "this" {
  db_proxy_name          = aws_db_proxy.this.name
  target_group_name      = aws_db_proxy_default_target_group.this.name
  db_instance_identifier = aws_db_instance.this.id
  # db_cluster_identifier
}