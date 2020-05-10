# AWS RDS module

locals {
  # Subnet group name
  sg_name = var.sg_name == null ? "${var.name}-sg" : var.sg_name
  # Option group name
  og_name = var.og_name == null ? "${var.name}-og" : var.og_name
  # Parameter group name
  pg_name = var.pg_name == null ? "${var.name}-pg" : var.pg_name
}

resource "aws_db_subnet_group" "main" {
  name        = local.sg_name
  description = var.sg_description
  subnet_ids  = var.sg_subnet_ids

  tags = merge({ Name = local.sg_name }, var.tags, var.sg_tags)
}

resource "aws_db_option_group" "main" {
  count = var.og_engine_name != null ? 1 : 0

  name                     = local.og_name
  option_group_description = var.og_description
  engine_name              = var.og_engine_name
  major_engine_version     = var.og_major_engine_version

  dynamic "option" {
    for_each = var.og_options == null ? [] : var.og_options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = option.value.option_settings == null ? [] : option.value.option_settings
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  tags = merge({ Name = local.og_name }, var.tags, var.og_tags)
}

resource "aws_db_parameter_group" "main" {
  count = var.pg_family != null ? 1 : 0

  name        = local.pg_name
  description = var.pg_description
  family      = var.pg_family

  dynamic "parameter" {
    for_each = var.pg_parameters == null ? [] : var.pg_parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  tags = merge({ Name = local.pg_name }, var.tags, var.pg_tags)
}

resource "aws_db_instance" "main" {
  allocated_storage           = var.db_allocated_storage
  allow_major_version_upgrade = var.db_allow_major_version_upgrade
  apply_immediately           = var.db_apply_immediately
  auto_minor_version_upgrade  = var.db_auto_minor_version_upgrade
  availability_zone           = var.db_availability_zone
  backup_retention_period     = var.db_backup_retention_period
  backup_window               = var.db_backup_window
  ca_cert_identifier          = var.db_ca_cert_identifier
  character_set_name          = var.db_character_set_name
  copy_tags_to_snapshot       = var.db_copy_tags_to_snapshot
  db_subnet_group_name        = aws_db_subnet_group.main.name
  #delete_automated_backups              = var.db_delete_automated_backups
  deletion_protection                 = var.db_deletion_protection
  domain                              = var.db_domain
  domain_iam_role_name                = var.db_domain_iam_role_name
  enabled_cloudwatch_logs_exports     = var.db_enabled_cloudwatch_logs_exports
  engine                              = var.db_engine
  engine_version                      = var.db_engine_version
  final_snapshot_identifier           = var.db_final_snapshot_identifier
  iam_database_authentication_enabled = var.db_iam_database_authentication_enabled
  identifier                          = var.name
  instance_class                      = var.db_instance_class
  iops                                = var.db_iops
  kms_key_id                          = var.db_kms_key_id
  license_model                       = var.db_license_model
  maintenance_window                  = var.db_maintenance_window
  max_allocated_storage               = var.db_max_allocated_storage
  monitoring_interval                 = var.db_monitoring_interval
  monitoring_role_arn                 = var.db_monitoring_role_arn
  multi_az                            = var.db_multi_az
  name                                = var.db_name
  option_group_name                   = length(aws_db_option_group.main) == 1 ? aws_db_option_group.main[0].name : var.db_option_group_name
  parameter_group_name                = length(aws_db_parameter_group.main) == 1 ? aws_db_parameter_group.main[0].name : var.db_parameter_group_name
  password                            = var.db_password

  lifecycle {
    ignore_changes = [
      password,
    ]
  }

  port                                  = var.db_port
  publicly_accessible                   = var.db_publicly_accessible
  replicate_source_db                   = var.db_replicate_source_db
  security_group_names                  = var.db_security_group_names
  skip_final_snapshot                   = var.db_skip_final_snapshot
  snapshot_identifier                   = var.db_snapshot_identifier
  storage_encrypted                     = var.db_storage_encrypted
  storage_type                          = var.db_storage_type
  timezone                              = var.db_timezone
  username                              = var.db_username
  vpc_security_group_ids                = var.db_vpc_security_group_ids
  performance_insights_enabled          = var.db_performance_insights_enabled
  performance_insights_kms_key_id       = var.db_performance_insights_kms_key_id
  performance_insights_retention_period = var.db_performance_insights_retention_period

  dynamic "s3_import" {
    for_each = var.db_s3_import == null ? [] : [var.db_s3_import]
    content {
      bucket_name           = s3_import.value.bucket_name
      bucket_prefix         = lookup(s3_import.value, "bucket_prefix", null)
      ingestion_role        = s3_import.value.ingestion_role
      source_engine         = s3_import.value.source_engine
      source_engine_version = s3_import.value.source_engine_version
    }
  }

  tags = merge({ Name = var.name }, var.tags, var.db_tags)
}
