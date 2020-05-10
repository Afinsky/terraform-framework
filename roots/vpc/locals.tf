locals {
  common_tags = {
    "coherent:client"      = ""
    "coherent:project"     = ""
    "coherent:environment" = "${var.environment}"
    "coherent:owner"       = "AlexeyBotyan@coherentsolutions.com"
  }

  project_name = "roofle"

  resource_name = "${var.environment}-${local.project_name}"
}