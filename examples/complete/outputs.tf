output "role_arn" {
  description = "ARN of the created IAM role."
  value       = module.iam_role.arn
}

output "role_name" {
  description = "Name of the created IAM role."
  value       = module.iam_role.name
}