output "arn" {
  description = "The ARN of the CodeBuild project"
  value       = aws_codebuild_project.this.id
}

output "id" {
  description = " The name (if imported via name) or ARN (if created via Terraform or imported via ARN) of the CodeBuild project."
  value       = aws_codebuild_project.this.name
}

output "name" {
  description = "The name of the CodeBuild project"
  value       = aws_codebuild_project.this.name
}

output "service_role_name" {
  description = "Name of the Service Role created for CodeBuild."
  value       = var.create_default_service_role ? element(aws_iam_role.service_role.*.name, 0) : null
}

output "service_role_arn" {
  description = "Amazon Resource Name (ARN) of the Service Role for CodeBuild."
  value       = var.create_default_service_role ? element(aws_iam_role.service_role.*.arn, 0) : null
}

output "service_role_id" {
  description = "ID of the Service Role created for CodeBuild."
  value       = var.create_default_service_role ? element(aws_iam_role.service_role.*.id, 0) : null
}
