# DB Subnet Group
output "aws_db_subnet_group_id" {
  value       = aws_db_subnet_group.this.id
  description = "The db subnet group name."
}

output "aws_db_subnet_group_arn" {
  value       = aws_db_subnet_group.this.arn
  description = "The ARN of the db subnet group."
}

# Security Group
output "aws_security_group_id" {
  value       = aws_security_group.this.id
  description = "The ID of the security group"
}

output "aws_security_group_arn" {
  value       = aws_security_group.this.arn
  description = "The ARN of the security group"
}

output "aws_security_group_vpc_id" {
  value       = aws_security_group.this.vpc_id
  description = "The VPC ID."
}

output "aws_security_group_owner_id" {
  value       = aws_security_group.this.owner_id
  description = "The owner ID."
}

output "aws_security_group_name" {
  value       = aws_security_group.this.name
  description = "The name of the security group"
}

output "aws_security_group_description" {
  value       = aws_security_group.this.description
  description = "The description of the security group"
}

output "aws_security_group_ingress" {
  value       = aws_security_group.this.ingress
  description = "The ingress rules."
}

output "aws_security_group_egress" {
  value       = aws_security_group.this.egress
  description = "The ingress rules."
}

# RDS
output "aws_db_instance_address" {
  value       = aws_db_instance.this.address
  description = "The hostname of the RDS instance. See also endpoint and port."
}

output "aws_db_instance_arn" {
  value       = aws_db_instance.this.arn
  description = "The ARN of the RDS instance."
}

output "aws_db_instance_allocated_storage" {
  value       = aws_db_instance.this.allocated_storage
  description = "The amount of allocated storage."
}

output "aws_db_instance_availability_zone" {
  value       = aws_db_instance.this.availability_zone
  description = "The availability zone of the instance."
}

output "aws_db_instance_backup_retention_period" {
  value       = aws_db_instance.this.backup_retention_period
  description = "backup_retention_period - The backup retention period."
}

output "aws_db_instance_backup_window" {
  value       = aws_db_instance.this.backup_window
  description = "The backup window."
}

output "aws_db_instance_ca_cert_identifier" {
  value       = aws_db_instance.this.ca_cert_identifier
  description = "Specifies the identifier of the CA certificate for the DB instance."
}

output "aws_db_instance_domain" {
  value       = aws_db_instance.this.domain
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
}

output "aws_db_instance_character_set_name" {
  value       = aws_db_instance.this.character_set_name
  description = "The character set (collation) used on Oracle and Microsoft SQL instances."
}

output "aws_db_instance_domain_iam_role_name" {
  value       = aws_db_instance.this.domain_iam_role_name
  description = "The name of the IAM role to be used when making API calls to the Directory Service."
}

output "aws_db_instance_endpoint" {
  value       = aws_db_instance.this.endpoint
  description = "The connection endpoint in address:port format."
}

output "aws_db_instance_engine" {
  value       = aws_db_instance.this.engine
  description = "The database engine."
}

output "aws_db_instance_engine_version" {
  value       = aws_db_instance.this.engine_version
  description = "The database engine version."
}

output "aws_db_instance_hosted_zone_id" {
  value       = aws_db_instance.this.hosted_zone_id
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
}

output "aws_db_instance_id" {
  value       = aws_db_instance.this.id
  description = "The RDS instance ID."
}

output "aws_db_instance_instance_class" {
  value       = aws_db_instance.this.instance_class
  description = "The RDS instance class."
}

output "aws_db_instance_latest_restorable_time" {
  value       = aws_db_instance.this.latest_restorable_time
  description = "The latest time, in UTC RFC3339 format, to which a database can be restored with point-in-time restore."
}

output "aws_db_instance_maintenance_window" {
  value       = aws_db_instance.this.maintenance_window
  description = "The instance maintenance window."
}

output "aws_db_instance_multi_az" {
  value       = aws_db_instance.this.multi_az
  description = "If the RDS instance is multi AZ enabled."
}

output "aws_db_instance_name" {
  value       = aws_db_instance.this.name
  description = "The database name."
}

output "aws_db_instance_port" {
  value       = aws_db_instance.this.port
  description = "The database port."
}

output "aws_db_instance_resource_id" {
  value       = aws_db_instance.this.resource_id
  description = "The RDS Resource ID of this instance."
}

output "aws_db_instance_status" {
  value       = aws_db_instance.this.status
  description = "The RDS instance status."
}

output "aws_db_instance_storage_encrypted" {
  value       = aws_db_instance.this.storage_encrypted
  description = "Specifies whether the DB instance is encrypted."
}

output "aws_db_instance_username" {
  value       = aws_db_instance.this.username
  description = "The master username for the database."
}