# General
aws_region  = "ap-southeast-1"
aws_account = "623552185285" # AWS account where resource will be created
aws_role    = "OrganizationAccountAccessRole"

# Tagging
namespace       = "bbsdm"
bounded_context = "shared"
environment     = "production"

# DB Subnet Group
aws_db_subnet_group_name       = "bbsdm-shared-rds-sn-grp"
aws_db_subnet_group_subnet1_id = "subnet-082aa9c58fee2d1bc"
aws_db_subnet_group_subnet2_id = "subnet-00e827d6528d49c3e"

# DB Security Group
aws_security_group_name   = "bbsdm-shared-rds-sg"
aws_security_group_vpc_id = "vpc-02ded520cd1f614e9"

# RDS Database
aws_db_instance_allocated_storage       = 20
aws_db_instance_availability_zone       = "ap-southeast-1a"
aws_db_instance_backup_retention_period = 7
aws_db_instance_backup_window           = "09:00-09:30"
aws_db_instance_ca_cert_identifier      = "rds-ca-2019"
aws_db_instance_engine                  = "mysql"
aws_db_instance_engine_version          = "8.0.21"
aws_db_instance_identifier              = "bbsdm-shared-rds"
aws_db_instance_instance_class          = "db.t3.micro"
aws_db_instance_maintenance_window      = "Mon:00:00-Mon:03:00"
aws_db_instance_max_allocated_storage   = 100
aws_db_instance_name                    = "mydb"
aws_db_instance_parameter_group_name    = "default.mysql8.0"
aws_db_instance_password                = "foobarbaz"
aws_db_instance_port                    = 3306
aws_db_instance_storage_type            = "gp2"
aws_db_instance_username                = "admin"

# Secrets Manager
aws_secretsmanager_secret_name = "bbsdm-shared-rds-secret"

# IAM Role & Policy
rds_service_role_name        = "bbsdm-shared-rds-service-role"
rds_service_role_policy_name = "bbsdm-shared-rds-service-role-policy"

# RDS Proxy
aws_db_proxy_name = "bbsdm-shared-rds-proxy"