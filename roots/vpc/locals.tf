locals {
  common_tags = {
    "coherent:client"      = ""
    "coherent:project"     = ""
    "coherent:environment" = "${var.environment}"
    "coherent:owner"       = "AlexeyBotyan@coherentsolutions.com"
  }

  #resource_name = var.project_name == null ? "${var.environment}" : "${var.project_name}-${var.environment}"
}