module "rds" {
  source = "git::https://github.com/jrdalino/aws-rds-terraform.git?ref=main"
  # General
  aws_region              = var.aws_region
  aws_account             = var.aws_account
  aws_role                = var.aws_role

  # Tagging
  namespace               = var.namespace
  bounded_context         = var.bounded_context
  environment             = var.environment

  # DB Subnet Group
  aws_db_subnet_group_name       = var.aws_db_subnet_group_name
  aws_db_subnet_group_subnet1_id = var.aws_db_subnet_group_subnet1_id
  aws_db_subnet_group_subnet2_id = var.aws_db_subnet_group_subnet2_id

  # DB Security Group
  aws_security_group_name   = var.aws_security_group_name
  aws_security_group_vpc_id = var.aws_security_group_vpc_id

  # RDS Database
  aws_db_instance_allocated_storage = var.aws_db_instance_allocated_storage
  aws_db_instance_availability_zone = var.aws_db_instance_availability_zone
  aws_db_instance_backup_retention_period = var.aws_db_instance_backup_retention_period
  aws_db_instance_backup_window = var.aws_db_instance_backup_window
  aws_db_instance_ca_cert_identifier = var.aws_db_instance_ca_cert_identifier
  aws_db_instance_engine = var.aws_db_instance_engine
  aws_db_instance_engine_version = var.aws_db_instance_engine_version
  aws_db_instance_identifier = var.aws_db_instance_identifier
  aws_db_instance_instance_class = var.aws_db_instance_instance_class
  aws_db_instance_maintenance_window = var.aws_db_instance_maintenance_window
  aws_db_instance_max_allocated_storage = var.aws_db_instance_max_allocated_storage
  aws_db_instance_name = var.aws_db_instance_name
  aws_db_instance_parameter_group_name = var.aws_db_instance_parameter_group_name
  aws_db_instance_password = var.aws_db_instance_password
  aws_db_instance_port = var.aws_db_instance_port
  aws_db_instance_storage_type = var.aws_db_instance_storage_type
  aws_db_instance_username = var.aws_db_instance_username

  # Secrets Manager
  aws_secretsmanager_secret_name = var.aws_secretsmanager_secret_name

  # RDS Proxy
  aws_db_proxy_name = var.aws_db_proxy_name
}