# DB Subnet Group
output "aws_db_subnet_group_id" {
  value       = module.rds.aws_db_subnet_group_id
  description = "The db subnet group name."
}

output "aws_db_subnet_group_arn" {
  value       = module.rds.aws_db_subnet_group_arn
  description = "The ARN of the db subnet group."
}

# Security Group
output "aws_security_group_id" {
  value       = module.rds.aws_security_group_id
  description = "The ID of the security group"
}

output "aws_security_group_arn" {
  value       = module.rds.aws_security_group_arn
  description = "The ARN of the security group"
}

output "aws_security_group_vpc_id" {
  value       = module.rds.aws_security_group_vpc_id
  description = "The VPC ID."
}

output "aws_security_group_owner_id" {
  value       = module.rds.aws_security_group_owner_id
  description = "The owner ID."
}

output "aws_security_group_name" {
  value       = module.rds.aws_security_group_name
  description = "The name of the security group"
}

output "aws_security_group_description" {
  value       = module.rds.aws_security_group_description
  description = "The description of the security group"
}

output "aws_security_group_ingress" {
  value       = module.rds.aws_security_group_ingress
  description = "The ingress rules."
}

output "aws_security_group_egress" {
  value       = module.rds.aws_security_group_egress
  description = "The ingress rules."
}

# RDS
output "aws_db_instance_address" {
  value       = module.rds.aws_db_instance_address
  description = "The hostname of the RDS instance. See also endpoint and port."
}

output "aws_db_instance_arn" {
  value       = module.rds.aws_db_instance_arn
  description = "The ARN of the RDS instance."
}

output "aws_db_instance_allocated_storage" {
  value       = module.rds.aws_db_instance_allocated_storage
  description = "The amount of allocated storage."
}

output "aws_db_instance_availability_zone" {
  value       = module.rds.aws_db_instance_availability_zone
  description = "The availability zone of the instance."
}

output "aws_db_instance_backup_retention_period" {
  value       = module.rds.aws_db_instance_backup_retention_period
  description = "backup_retention_period - The backup retention period."
}

output "aws_db_instance_backup_window" {
  value       = module.rds.aws_db_instance_backup_window
  description = "The backup window."
}

output "aws_db_instance_ca_cert_identifier" {
  value       = module.rds.aws_db_instance_ca_cert_identifier
  description = "Specifies the identifier of the CA certificate for the DB instance."
}

output "aws_db_instance_domain" {
  value       = module.rds.aws_db_instance_domain
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
}

output "aws_db_instance_character_set_name" {
  value       = module.rds.aws_db_instance_character_set_name
  description = "The character set (collation) used on Oracle and Microsoft SQL instances."
}

output "aws_db_instance_domain_iam_role_name" {
  value       = module.rds.aws_db_instance_domain_iam_role_name
  description = "The name of the IAM role to be used when making API calls to the Directory Service."
}

output "aws_db_instance_endpoint" {
  value       = module.rds.aws_db_instance_endpoint
  description = "The connection endpoint in address:port format."
}

output "aws_db_instance_engine" {
  value       = module.rds.aws_db_instance_engine
  description = "The database engine."
}

output "aws_db_instance_engine_version" {
  value       = module.rds.aws_db_instance_engine_version
  description = "The database engine version."
}

output "aws_db_instance_hosted_zone_id" {
  value       = module.rds.aws_db_instance_hosted_zone_id
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
}

output "aws_db_instance_id" {
  value       = module.rds.aws_db_instance_id
  description = "The RDS instance ID."
}

output "aws_db_instance_instance_class" {
  value       = module.rds.aws_db_instance_instance_class
  description = "The RDS instance class."
}

output "aws_db_instance_latest_restorable_time" {
  value       = module.rds.aws_db_instance_latest_restorable_time
  description = "The latest time, in UTC RFC3339 format, to which a database can be restored with point-in-time restore."
}

output "aws_db_instance_maintenance_window" {
  value       = module.rds.aws_db_instance_maintenance_window
  description = "The instance maintenance window."
}

output "aws_db_instance_multi_az" {
  value       = module.rds.aws_db_instance_multi_az
  description = "If the RDS instance is multi AZ enabled."
}

output "aws_db_instance_name" {
  value       = module.rds.aws_db_instance_name
  description = "The database name."
}

output "aws_db_instance_port" {
  value       = module.rds.aws_db_instance_port
  description = "The database port."
}

output "aws_db_instance_resource_id" {
  value       = module.rds.aws_db_instance_resource_id
  description = "The RDS Resource ID of this instance."
}

output "aws_db_instance_status" {
  value       = module.rds.aws_db_instance_status
  description = "The RDS instance status."
}

output "aws_db_instance_storage_encrypted" {
  value       = module.rds.aws_db_instance_storage_encrypted
  description = "Specifies whether the DB instance is encrypted."
}

output "aws_db_instance_username" {
  value       = module.rds.aws_db_instance_username
  description = "The master username for the database."
}

# Secrets Manager
output "aws_secretsmanager_secret_id" {
  value       = module.rds.aws_secretsmanager_secret_id
  description = "Id of the secret."
}

output "aws_secretsmanager_secret_arn" {
  value       = module.rds.aws_secretsmanager_secret_arn
  description = "Amazon Resource Name (ARN) of the secret."
}

output "aws_secretsmanager_secret_rotation_enabled" {
  value       = module.rds.aws_secretsmanager_secret_rotation_enabled
  description = "Specifies whether automatic rotation is enabled for this secret."
}

# RDS Proxy
output "aws_db_proxy_id" {
  value       = module.rds.aws_db_proxy_id
  description = "The Amazon Resource Name (ARN) for the proxy."
}

output "aws_db_proxy_arn" {
  value       = module.rds.aws_db_proxy_arn
  description = "The Amazon Resource Name (ARN) for the proxy."
}

output "aws_db_proxy_endpoint" {
  value       = module.rds.aws_db_proxy_endpoint
  description = "The endpoint that you can use to connect to the proxy. You include the endpoint value in the connection string for a database client application."
}

# RDS Proxy Default Target Group
output "aws_db_proxy_default_target_group_id" {
  value       = module.rds.aws_db_proxy_default_target_group_id
  description = "Name of the RDS DB Proxy."
}

output "aws_db_proxy_default_target_group_arn" {
  value       = module.rds.aws_db_proxy_default_target_group_arn
  description = "The Amazon Resource Name (ARN) representing the target group."
}

output "aws_db_proxy_default_target_group_name" {
  value       = module.rds.aws_db_proxy_default_target_group_name
  description = "The name of the default target group."
}

# RDS Proxy Target
output "aws_db_proxy_target_endpoint" {
  value       = module.rds.aws_db_proxy_target_endpoint
  description = "Hostname for the target RDS DB Instance. Only returned for RDS_INSTANCE type."
}

output "aws_db_proxy_target_id" {
  value       = module.rds.aws_db_proxy_target_id
  description = "Identifier of db_proxy_name, target_group_name, target type (e.g. RDS_INSTANCE or TRACKED_CLUSTER), and resource identifier separated by forward slashes (/)."
}

output "aws_db_proxy_target_port" {
  value       = module.rds.aws_db_proxy_target_port
  description = "Port for the target RDS DB Instance or Aurora DB Cluster."
}

output "aws_db_proxy_target_rds_resource_id" {
  value       = module.rds.aws_db_proxy_target_rds_resource_id
  description = "Identifier representing the DB Instance or DB Cluster target."
}

output "aws_db_proxy_target_target_arn" {
  value       = module.rds.aws_db_proxy_target_target_arn
  description = "Amazon Resource Name (ARN) for the DB instance or DB cluster. Currently not returned by the RDS API."
}

output "aws_db_proxy_target_tracked_cluster_id" {
  value       = module.rds.aws_db_proxy_target_tracked_cluster_id
  description = "DB Cluster identifier for the DB Instance target. Not returned unless manually importing an RDS_INSTANCE target that is part of a DB Cluster."
}

output "aws_db_proxy_target_type" {
  value       = module.rds.aws_db_proxy_target_type
  description = "Type of target. e.g. RDS_INSTANCE or TRACKED_CLUSTER"
}