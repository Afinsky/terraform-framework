# General variables
variable "name" {
  description = "General name for resources."
  type        = string
}

variable "tags" {
  description = "(optional) General tags for resources."
  type        = map(string)
  default     = {}
}

# Subnet group variables. https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html
variable "sg_name" {
  description = "(optional) Subnet group `name` argument."
  type        = string
  default     = null
}

variable "sg_description" {
  description = "(optional) Subnet group `description` argument."
  type        = string
  default     = null
}

variable "sg_subnet_ids" {
  description = "Subnet group `subnet_ids` argument."
  type        = list(string)
}

variable "sg_tags" {
  description = "(optional) Subnet group `tags` argument."
  type        = map(string)
  default     = {}
}

# Option group variables. https://www.terraform.io/docs/providers/aws/r/db_option_group.html
variable "og_name" {
  description = "(optional) Option group `name` argument."
  type        = string
  default     = null
}

variable "og_description" {
  description = "(optional) Option group `option_group_description` argument."
  type        = string
  default     = null
}

variable "og_engine_name" {
  description = "(optional) Option group `engine_name` argument. If specified will create new option group resource and assign it to DB."
  type        = string
  default     = null
}

variable "og_major_engine_version" {
  description = "(optional) Option group `major_engine_version` argument. Required if og_engine_name specified."
  type        = string
  default     = null
}

variable "og_options" {
  description = "(optional) Option group `option` blocks list. https://www.terraform.io/docs/providers/aws/r/db_option_group.html#option Ex. [{option_name = 'required', port = 'optional', version = 'optional', db_security_group_memberships = 'optional', vpc_security_group_memberships = 'optional', option_settings = { name = 'optional', value = 'optional' } }]"
  type        = list(any)
  default     = null
}

variable "og_tags" {
  description = "(optional) Option group `tags` argument."
  type        = map(string)
  default     = {}
}

# Parameter group variables. https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html
variable "pg_name" {
  description = "(optional) Parameter group `name` argument."
  type        = string
  default     = null
}

variable "pg_description" {
  description = "(optional) Parameter group `description` argument."
  type        = string
  default     = null
}

variable "pg_family" {
  description = "(optional) Parameter group `family` argument. If specified will create new parameter group resource and assign it to DB."
  type        = string
  default     = null
}

variable "pg_parameters" {
  description = "(optional) Parameter group `parameter` blocks list. https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html#parameter Ex. [{ name = 'required', value = 'required', apply_method = 'optional' }]"
  type        = list(map(string))
  default     = null
}

variable "pg_tags" {
  description = "(optional) Parameter group `tags` argument."
  type        = map(string)
  default     = {}
}

# DB instance variables. https://www.terraform.io/docs/providers/aws/r/db_instance.html
variable "db_allocated_storage" {
  description = "(optional) DB instance `allocated_storage` argument."
  type        = number
  default     = null
}

variable "db_allow_major_version_upgrade" {
  description = "(optional) DB instance `allow_major_version_upgrade` argument."
  type        = bool
  default     = null
}

variable "db_apply_immediately" {
  description = "(optional) DB instance `apply_immediately` argument."
  type        = bool
  default     = null
}

variable "db_auto_minor_version_upgrade" {
  description = "(optional) DB instance `auto_minor_version_upgrade` argument."
  type        = bool
  default     = null
}

variable "db_availability_zone" {
  description = "(optional) DB instance `availability_zone` argument."
  type        = string
  default     = null
}

variable "db_backup_retention_period" {
  description = "(optional) DB instance `backup_retention_period` argument."
  type        = number
  default     = null
}

variable "db_backup_window" {
  description = "(optional) DB instance `backup_window` argument."
  type        = string
  default     = null
}

variable "db_ca_cert_identifier" {
  description = "(optional) DB instance `ca_cert_identifier` argument."
  type        = string
  default     = null
}

variable "db_character_set_name" {
  description = "(optional) DB instance `character_set_name` argument."
  type        = string
  default     = null
}

variable "db_copy_tags_to_snapshot" {
  description = "(optional) DB instance `copy_tags_to_snapshot` argument."
  type        = bool
  default     = null
}

variable "db_delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type        = bool
  default     = "true"
}

variable "db_deletion_protection" {
  description = "(optional) DB instance `deletion_protection` argument."
  type        = bool
  default     = null
}

variable "db_domain" {
  description = "(optional) DB instance `domain` argument."
  type        = string
  default     = null
}

variable "db_domain_iam_role_name" {
  description = "(optional) DB instance `domain_iam_role_name` argument."
  type        = string
  default     = null
}

variable "db_enabled_cloudwatch_logs_exports" {
  description = "(optional) DB instance `enabled_cloudwatch_logs_exports` argument."
  type        = list(string)
  default     = null
}

variable "db_engine" {
  description = "(optional) DB instance `engine` argument."
  type        = string
  default     = null
}

variable "db_engine_version" {
  description = "(optional) DB instance `engine_version` argument."
  type        = string
  default     = null
}

variable "db_final_snapshot_identifier" {
  description = "(optional) DB instance `final_snapshot_identifier` argument."
  type        = string
  default     = null
}

variable "db_iam_database_authentication_enabled" {
  description = "(optional) DB instance `iam_database_authentication_enabled` argument."
  type        = bool
  default     = null
}

variable "db_instance_class" {
  description = "DB instance `instance_class` argument."
  type        = string
}

variable "db_iops" {
  description = "(optional) DB instance `iops` argument."
  type        = string
  default     = null
}

variable "db_kms_key_id" {
  description = "(optional) DB instance `kms_key_id` argument."
  type        = string
  default     = null
}

variable "db_license_model" {
  description = "(optional) DB instance `license_model` argument."
  type        = string
  default     = null
}

variable "db_maintenance_window" {
  description = "(optional) DB instance `maintenance_window` argument."
  type        = string
  default     = null
}

variable "db_max_allocated_storage" {
  description = "(optional) DB instance `max_allocated_storage` argument."
  type        = number
  default     = null
}

variable "db_monitoring_interval" {
  description = "(optional) DB instance `monitoring_interval` argument."
  type        = number
  default     = null
}

variable "db_monitoring_role_arn" {
  description = "(optional) DB instance `monitoring_role_arn` argument."
  type        = string
  default     = null
}

variable "db_multi_az" {
  description = "(optional) DB instance `multi_az` argument."
  type        = bool
  default     = null
}

variable "db_name" {
  description = "(optional) DB instance `name` argument."
  type        = string
  default     = null
}

variable "db_option_group_name" {
  description = "(optional) DB instance `option_group_name` argument."
  type        = string
  default     = null
}

variable "db_parameter_group_name" {
  description = "(optional) DB instance `parameter_group_name` argument."
  type        = string
  default     = null
}

variable "db_password" {
  description = "(optional) DB instance `password` argument."
  type        = string
  default     = null
}

variable "db_port" {
  description = "(optional) DB instance `port` argument."
  type        = number
  default     = null
}

variable "db_publicly_accessible" {
  description = "(optional) DB instance `publicly_accessible` argument."
  type        = bool
  default     = null
}

variable "db_replicate_source_db" {
  description = "(optional) DB instance `replicate_source_db` argument."
  type        = string
  default     = null
}

variable "db_security_group_names" {
  description = "(optional) DB instance `security_group_names` argument."
  type        = list(string)
  default     = null
}

variable "db_skip_final_snapshot" {
  description = "(optional) DB instance `skip_final_snapshot` argument."
  type        = bool
  default     = null
}

variable "db_snapshot_identifier" {
  description = "(optional) DB instance `snapshot_identifier` argument."
  type        = string
  default     = null
}

variable "db_storage_encrypted" {
  description = "(optional) DB instance `storage_encrypted` argument."
  type        = bool
  default     = null
}

variable "db_storage_type" {
  description = "(optional) DB instance `storage_type` argument."
  type        = string
  default     = null
}

variable "db_timezone" {
  description = "(optional) DB instance `timezone` argument."
  type        = string
  default     = null
}

variable "db_username" {
  description = "(optional) DB instance `username` argument."
  type        = string
  default     = null
}

variable "db_vpc_security_group_ids" {
  description = "(optional) DB instance `vpc_security_group_ids` argument."
  type        = list(string)
  default     = null
}

variable "db_performance_insights_enabled" {
  description = "(optional) DB instance `performance_insights_enabled` argument."
  type        = bool
  default     = null
}

variable "db_performance_insights_kms_key_id" {
  description = "(optional) DB instance `performance_insights_kms_key_id` argument."
  type        = string
  default     = null
}

variable "db_performance_insights_retention_period" {
  description = "(optional) DB instance `performance_insights_retention_period` argument."
  type        = number
  default     = null
}

variable "db_s3_import" {
  description = "(optional) DB instance `s3_import` block. https://www.terraform.io/docs/providers/aws/r/db_instance.html#s3-import-options Ex. { bucket_name = 'required', bucket_prefix = 'optional', ingestion_role = 'required', source_engine = 'required', source_engine_version = 'required' }"
  type        = map(string)
  default     = null
}

variable "db_tags" {
  description = "(optional) DB instance `tags` argument."
  type        = map(string)
  default     = {}
}
