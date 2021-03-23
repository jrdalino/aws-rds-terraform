# General
variable "aws_region" {
  type        = string
  description = "Used AWS Region."
}

variable "aws_account" {
  type        = string
  description = "Used AWS Account."
}

variable "aws_role" {
  type        = string
  description = "Used AWS Role."
}

# Tagging
variable "namespace" {
  type        = string
  description = "Namespace."
}

variable "bounded_context" {
  type        = string
  description = "Bounded Context."
}

variable "environment" {
  type        = string
  description = "Environment."
}

# DB Subnet Group
variable "aws_db_subnet_group_name" {}
variable "aws_db_subnet_group_subnet1_id" {}
variable "aws_db_subnet_group_subnet2_id" {}

# DB Security Group
variable "aws_security_group_name" {}
variable "aws_security_group_vpc_id" {}

# RDS Database
variable "aws_db_instance_allocated_storage" {}
variable "aws_db_instance_availability_zone" {}
variable "aws_db_instance_backup_retention_period" {}
variable "aws_db_instance_backup_window" {}
variable "aws_db_instance_ca_cert_identifier" {}
variable "aws_db_instance_engine" {}
variable "aws_db_instance_engine_version" {}
variable "aws_db_instance_identifier" {}
variable "aws_db_instance_instance_class" {}
variable "aws_db_instance_maintenance_window" {}
variable "aws_db_instance_max_allocated_storage" {}
variable "aws_db_instance_name" {}
variable "aws_db_instance_parameter_group_name" {}
variable "aws_db_instance_password" {}
variable "aws_db_instance_port" {}
variable "aws_db_instance_storage_type" {}
variable "aws_db_instance_username" {}