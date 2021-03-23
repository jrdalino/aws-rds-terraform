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
  engine                         = var.aws_db_instance_engine
  engine_version                 = var.aws_db_instance_engine_version
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