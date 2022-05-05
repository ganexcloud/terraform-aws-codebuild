resource "aws_codebuild_project" "this" {
  name                   = var.name
  description            = var.description
  service_role           = local.service_role_arn
  encryption_key         = var.encryption_key
  build_timeout          = var.build_timeout
  badge_enabled          = var.badge_enabled
  source_version         = var.codebuild_source_version
  queued_timeout         = var.queued_timeout
  concurrent_build_limit = var.concurrent_build_limit
  # Artifacts
  dynamic "artifacts" {
    for_each = local.artifacts
    content {
      type                   = lookup(artifacts.value, "type")
      artifact_identifier    = lookup(artifacts.value, "artifact_identifier")
      encryption_disabled    = lookup(artifacts.value, "encryption_disabled")
      override_artifact_name = lookup(artifacts.value, "override_artifact_name")
      location               = lookup(artifacts.value, "location")
      name                   = lookup(artifacts.value, "name")
      namespace_type         = lookup(artifacts.value, "namespace_type")
      packaging              = lookup(artifacts.value, "packaging")
      path                   = lookup(artifacts.value, "path")
    }
  }

  # Cache
  dynamic "cache" {
    for_each = local.cache
    content {
      type     = lookup(cache.value, "type")
      location = lookup(cache.value, "location")
      modes    = lookup(cache.value, "modes")
    }
  }

  # Environment
  dynamic "environment" {
    for_each = local.environment
    content {
      compute_type                = lookup(environment.value, "compute_type")
      image                       = lookup(environment.value, "image")
      type                        = lookup(environment.value, "type")
      image_pull_credentials_type = lookup(environment.value, "image_pull_credentials_type")
      privileged_mode             = lookup(environment.value, "privileged_mode")
      certificate                 = lookup(environment.value, "certificate")

      # Registry Credential
      dynamic "registry_credential" {
        for_each = length(lookup(environment.value, "registry_credential")) == 0 ? [] : [lookup(environment.value, "registry_credential")]
        content {
          credential          = registry_credential.value.credential
          credential_provider = registry_credential.value.credential_provider
        }
      }

      # Environment variables
      dynamic "environment_variable" {
        for_each = length(lookup(environment.value, "variables")) == 0 ? [] : lookup(environment.value, "variables")
        content {
          name  = environment_variable.value.name
          value = environment_variable.value.value
          type  = lookup(environment_variable.value, "type", null) == null ? "PLAINTEXT" : environment_variable.value.type
        }
      }
    }
  }

  # Logs_config
  dynamic "logs_config" {
    for_each = local.logs_config
    content {

      # Cloudwatch_logs
      dynamic "cloudwatch_logs" {
        for_each = [lookup(logs_config.value, "cloudwatch_logs")]
        content {
          status      = cloudwatch_logs.value.status
          group_name  = cloudwatch_logs.value.group_name
          stream_name = cloudwatch_logs.value.stream_name
        }
      }

      # S3_logs
      dynamic "s3_logs" {
        for_each = [lookup(logs_config.value, "s3_logs")]
        content {
          status              = s3_logs.value.status
          location            = s3_logs.value.location
          encryption_disabled = s3_logs.value.encryption_disabled
        }
      }

    }
  }

  # Source
  dynamic "source" {
    for_each = local.source
    content {
      type                = lookup(source.value, "type")
      buildspec           = lookup(source.value, "buildspec")
      git_clone_depth     = lookup(source.value, "git_clone_depth")
      insecure_ssl        = lookup(source.value, "insecure_ssl")
      location            = lookup(source.value, "location")
      report_build_status = lookup(source.value, "report_build_status")

      # Auth
      dynamic "auth" {
        for_each = length(lookup(source.value, "auth")) == 0 ? [] : [lookup(source.value, "auth")]
        content {
          type     = auth.value.type
          resource = auth.value.resource
        }
      }

      # Git Submodules Config
      dynamic "git_submodules_config" {
        for_each = length(lookup(source.value, "git_submodules_config")) == 0 ? [] : [lookup(source.value, "git_submodules_config")]
        content {
          fetch_submodules = git_submodules_config.value.fetch_submodules
        }
      }

    }
  }

  # Secondary Sources
  dynamic "secondary_sources" {
    for_each = local.secondary_sources
    content {
      type                = lookup(secondary_sources.value, "type", "CODEBUILD")
      buildspec           = lookup(secondary_sources.value, "buildspec", null)
      git_clone_depth     = lookup(secondary_sources.value, "git_clone_depth", 0)
      insecure_ssl        = lookup(secondary_sources.value, "insecure_ssl", var.codebuild_source_insecure_ssl)
      location            = lookup(secondary_sources.value, "location", null)
      report_build_status = lookup(secondary_sources.value, "report_build_status", var.codebuild_source_report_build_status)
      source_identifier   = lookup(secondary_sources.value, "source_identifier", null)

      # Auth
      dynamic "auth" {
        for_each = length(lookup(secondary_sources.value, "auth")) == 0 ? [] : [lookup(secondary_sources.value, "auth")]
        content {
          type     = auth.value.type
          resource = auth.value.resource
        }
      }

      # Git Submodules Config
      dynamic "git_submodules_config" {
        for_each = length(lookup(secondary_sources.value, "git_submodules_config")) == 0 ? [] : [lookup(secondary_sources.value, "git_submodules_config")]
        content {
          fetch_submodules = git_submodules_config.value.fetch_submodules
        }
      }
    }
  }

  # VPC Config
  dynamic "vpc_config" {
    for_each = lookup(local.vpc_config, "vpc_id") == null ? [] : [local.vpc_config]
    content {
      vpc_id             = lookup(vpc_config.value, "vpc_id")
      subnets            = lookup(vpc_config.value, "subnets")
      security_group_ids = lookup(vpc_config.value, "security_group_ids")
    }
  }

  # Tags
  tags = var.tags

}
