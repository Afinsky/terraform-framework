output "address" {
  description = "DB instance `address` attribute."
  value       = aws_db_instance.main.address
}

output "arn" {
  description = "DB instance `arn` attribute."
  value       = aws_db_instance.main.arn
}

output "endpoint" {
  description = "DB instance `endpoint` attribute."
  value       = aws_db_instance.main.endpoint
}

output "hosted_zone_id" {
  description = "DB instance `hosted_zone_id` attribute."
  value       = aws_db_instance.main.hosted_zone_id
}

output "status" {
  description = "DB instance `status` attribute."
  value       = aws_db_instance.main.status
}

output "username" {
  value = aws_db_instance.main.username
}

output "name" {
  value = aws_db_instance.main.name
}

output "port" {
  value = aws_db_instance.main.port
}
