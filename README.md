<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.codebuild_role_extra_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.codebuild_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild_role_extra_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policy"></a> [additional\_policy](#input\_additional\_policy) | The custom extra policy document. This is a JSON formatted string. | `string` | `""` | no |
| <a name="input_artifacts"></a> [artifacts](#input\_artifacts) | Information about the project's build output artifacts. | `any` | `{}` | no |
| <a name="input_artifacts_artifact_identifier"></a> [artifacts\_artifact\_identifier](#input\_artifacts\_artifact\_identifier) | The artifact identifier. Must be the same specified inside AWS CodeBuild buildspec. | `string` | `null` | no |
| <a name="input_artifacts_encryption_disabled"></a> [artifacts\_encryption\_disabled](#input\_artifacts\_encryption\_disabled) | If set to true, output artifacts will not be encrypted. If `type` is set to `NO_ARTIFACTS` then this value will be ignored. | `bool` | `false` | no |
| <a name="input_artifacts_location"></a> [artifacts\_location](#input\_artifacts\_location) | Information about the build output artifact location. If `type` is set to `CODEPIPELINE` or `NO_ARTIFACTS` then this value will be ignored. If `type` is set to `S3`, this is the name of the output bucket. | `string` | `null` | no |
| <a name="input_artifacts_name"></a> [artifacts\_name](#input\_artifacts\_name) | The name of the project. If `type` is set to `S3`, this is the name of the output artifact object. | `string` | `null` | no |
| <a name="input_artifacts_namespace_type"></a> [artifacts\_namespace\_type](#input\_artifacts\_namespace\_type) | The namespace to use in storing build artifacts. If `type` is set to `S3`, then valid values for this parameter are: `BUILD_ID` or `NONE`. | `string` | `null` | no |
| <a name="input_artifacts_override_artifact_name"></a> [artifacts\_override\_artifact\_name](#input\_artifacts\_override\_artifact\_name) | If set to true, a name specified in the build spec file overrides the artifact name. | `bool` | `false` | no |
| <a name="input_artifacts_packaging"></a> [artifacts\_packaging](#input\_artifacts\_packaging) | The type of build output artifact to create. If `type` is set to `S3`, valid values for this parameter are: `NONE` or `ZIP` | `string` | `null` | no |
| <a name="input_artifacts_path"></a> [artifacts\_path](#input\_artifacts\_path) | If `type` is set to `S3`, this is the path to the output artifact | `string` | `""` | no |
| <a name="input_artifacts_type"></a> [artifacts\_type](#input\_artifacts\_type) | The build output artifact's type. Valid values for this parameter are: `CODEPIPELINE`, `NO_ARTIFACTS` or `S3`. | `string` | `"CODEPIPELINE"` | no |
| <a name="input_badge_enabled"></a> [badge\_enabled](#input\_badge\_enabled) | Generates a publicly-accessible URL for the projects build badge. Available as badge\_url attribute when enabled. | `bool` | `false` | no |
| <a name="input_build_timeout"></a> [build\_timeout](#input\_build\_timeout) | How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed.The default is 60 minutes. | `number` | `60` | no |
| <a name="input_cache"></a> [cache](#input\_cache) | Information about the cache storage for the project. | `any` | `{}` | no |
| <a name="input_cache_location"></a> [cache\_location](#input\_cache\_location) | The location where the AWS CodeBuild project stores cached resources. For type S3 the value must be a valid S3 bucket name/prefix. (Required when cache `type` is `S3`) | `string` | `null` | no |
| <a name="input_cache_modes"></a> [cache\_modes](#input\_cache\_modes) | Specifies settings that AWS CodeBuild uses to store and reuse build dependencies. Valid values: `LOCAL_SOURCE_CACHE`, `LOCAL_DOCKER_LAYER_CACHE`, and `LOCAL_CUSTOM_CACHE`. (Required when cache type is `LOCAL`) | `list(any)` | `[]` | no |
| <a name="input_cache_type"></a> [cache\_type](#input\_cache\_type) | The type of storage that will be used for the AWS CodeBuild project cache. Valid values: `NO_CACHE`, `LOCAL`, and `S3`. | `string` | `"NO_CACHE"` | no |
| <a name="input_cloudwatch_logs"></a> [cloudwatch\_logs](#input\_cloudwatch\_logs) | Configuration for the builds to store log data to CloudWatch. | `any` | `{}` | no |
| <a name="input_cloudwatch_logs_group_name"></a> [cloudwatch\_logs\_group\_name](#input\_cloudwatch\_logs\_group\_name) | The group name of the logs in CloudWatch Logs. | `string` | `null` | no |
| <a name="input_cloudwatch_logs_status"></a> [cloudwatch\_logs\_status](#input\_cloudwatch\_logs\_status) | Current status of logs in CloudWatch Logs for a build project. Valid values: `ENABLED`, `DISABLED.` | `string` | `"ENABLED"` | no |
| <a name="input_cloudwatch_logs_stream_name"></a> [cloudwatch\_logs\_stream\_name](#input\_cloudwatch\_logs\_stream\_name) | The stream name of the logs in CloudWatch Logs. | `string` | `null` | no |
| <a name="input_codebuild_secondary_source_auth"></a> [codebuild\_secondary\_source\_auth](#input\_codebuild\_secondary\_source\_auth) | Information about the authorization settings for AWS CodeBuild to access the source code to be built. | `map(any)` | `{}` | no |
| <a name="input_codebuild_secondary_source_buildspec"></a> [codebuild\_secondary\_source\_buildspec](#input\_codebuild\_secondary\_source\_buildspec) | The build spec declaration to use for this build project's related builds. Optional | `string` | `null` | no |
| <a name="input_codebuild_secondary_source_git_clone_depth"></a> [codebuild\_secondary\_source\_git\_clone\_depth](#input\_codebuild\_secondary\_source\_git\_clone\_depth) | Information about the Git submodules configuration for an AWS CodeBuild build project. Git submodules config blocks are documented below. This option is only valid when the type is `CODECOMMIT`. | `number` | `0` | no |
| <a name="input_codebuild_secondary_source_git_submodules_config"></a> [codebuild\_secondary\_source\_git\_submodules\_config](#input\_codebuild\_secondary\_source\_git\_submodules\_config) | Information about the Git submodules configuration for an AWS CodeBuild build project. Git submodules config blocks are documented below. This option is only valid when the type is `CODECOMMIT`. | `map(any)` | `{}` | no |
| <a name="input_codebuild_secondary_source_identifier"></a> [codebuild\_secondary\_source\_identifier](#input\_codebuild\_secondary\_source\_identifier) | The name of a folder named that the source will be checked out into inside the AWS CodeBuild source directory | `string` | `null` | no |
| <a name="input_codebuild_secondary_source_insecure_ssl"></a> [codebuild\_secondary\_source\_insecure\_ssl](#input\_codebuild\_secondary\_source\_insecure\_ssl) | Ignore SSL warnings when connecting to source control. | `bool` | `false` | no |
| <a name="input_codebuild_secondary_source_location"></a> [codebuild\_secondary\_source\_location](#input\_codebuild\_secondary\_source\_location) | The location of the source code from git or s3. | `string` | `null` | no |
| <a name="input_codebuild_secondary_source_report_build_status"></a> [codebuild\_secondary\_source\_report\_build\_status](#input\_codebuild\_secondary\_source\_report\_build\_status) | Set to true to report the status of a build's start and finish to your source provider. This option is only valid when the type is `BITBUCKET` or `GITHUB`. | `bool` | `false` | no |
| <a name="input_codebuild_secondary_source_type"></a> [codebuild\_secondary\_source\_type](#input\_codebuild\_secondary\_source\_type) | The type of repository that contains the secondary source code to be built. Valid values for this parameter are: `CODECOMMIT`, `CODEPIPELINE`, `GITHUB`, `GITHUB_ENTERPRISE`, `BITBUCKET`, `S3` or `NO_SOURCE`. | `string` | `"CODEPIPELINE"` | no |
| <a name="input_codebuild_secondary_sources"></a> [codebuild\_secondary\_sources](#input\_codebuild\_secondary\_sources) | Information about the project's secondary sources code. See the related codebuild source objects for descriptions of each parameter.<br>  The parameter `source_identifier` is the name of the directory to clone the secondary source into as a sibling to the primary source code directory.<br>  If this variable is omitted, no secondary sources are created.<br>  eg:<pre>codebuild_secondary_sources = [<br>    {<br>      type              = "GITHUB"<br>      location          = "https://github.com/myprofile/myproject-1.git"<br>      source_identifier = "my_awesome_project1"<br>    },<br>    {<br>      type                = "GITHUB"<br>      location            = "https://github.com/myprofile/myproject-2.git"<br>      git_clone_depth     = 1<br>      source_identifier   = "my_awesome_project2"<br>      report_build_status = true<br>      insecure_ssl        = true<br>    }<br>  ]</pre> | `any` | `[]` | no |
| <a name="input_codebuild_source"></a> [codebuild\_source](#input\_codebuild\_source) | Information about the project's input source code. | `any` | `{}` | no |
| <a name="input_codebuild_source_auth"></a> [codebuild\_source\_auth](#input\_codebuild\_source\_auth) | Information about the authorization settings for AWS CodeBuild to access the source code to be built. | `map(any)` | `{}` | no |
| <a name="input_codebuild_source_buildspec"></a> [codebuild\_source\_buildspec](#input\_codebuild\_source\_buildspec) | The build spec declaration to use for this build project's related builds. This must be set when type is iNO\_SOURCE | `string` | `null` | no |
| <a name="input_codebuild_source_git_clone_depth"></a> [codebuild\_source\_git\_clone\_depth](#input\_codebuild\_source\_git\_clone\_depth) | Information about the Git submodules configuration for an AWS CodeBuild build project. Git submodules config blocks are documented below. This option is only valid when the type is `CODECOMMIT`. | `number` | `0` | no |
| <a name="input_codebuild_source_git_submodules_config"></a> [codebuild\_source\_git\_submodules\_config](#input\_codebuild\_source\_git\_submodules\_config) | Information about the Git submodules configuration for an AWS CodeBuild build project. Git submodules config blocks are documented below. This option is only valid when the type is `CODECOMMIT`. | `map(any)` | `{}` | no |
| <a name="input_codebuild_source_insecure_ssl"></a> [codebuild\_source\_insecure\_ssl](#input\_codebuild\_source\_insecure\_ssl) | Ignore SSL warnings when connecting to source control. | `bool` | `false` | no |
| <a name="input_codebuild_source_location"></a> [codebuild\_source\_location](#input\_codebuild\_source\_location) | The location of the source code from git or s3. | `string` | `null` | no |
| <a name="input_codebuild_source_report_build_status"></a> [codebuild\_source\_report\_build\_status](#input\_codebuild\_source\_report\_build\_status) | Set to true to report the status of a build's start and finish to your source provider. This option is only valid when the type is `BITBUCKET` or `GITHUB`. | `bool` | `false` | no |
| <a name="input_codebuild_source_s3_bucket_name"></a> [codebuild\_source\_s3\_bucket\_name](#input\_codebuild\_source\_s3\_bucket\_name) | The location where the AWS CodeBuild project stores source resources. For type S3 the value must be a valid S3 bucket name/prefix. (Required when codebuild\_source\_type `type` is `CODEPIPELINE`) | `string` | `null` | no |
| <a name="input_codebuild_source_type"></a> [codebuild\_source\_type](#input\_codebuild\_source\_type) | The type of repository that contains the source code to be built. Valid values for this parameter are: `CODECOMMIT`, `CODEPIPELINE`, `GITHUB`, `GITHUB_ENTERPRISE`, `BITBUCKET`, `S3` or `NO_SOURCE`. | `string` | `"CODEPIPELINE"` | no |
| <a name="input_codebuild_source_version"></a> [codebuild\_source\_version](#input\_codebuild\_source\_version) | A version of the build input to be built for this project. If not specified, the latest version is used. | `string` | `null` | no |
| <a name="input_concurrent_build_limit"></a> [concurrent\_build\_limit](#input\_concurrent\_build\_limit) | Specify a maximum number of concurrent builds for the project. | `number` | `1` | no |
| <a name="input_create_default_service_role"></a> [create\_default\_service\_role](#input\_create\_default\_service\_role) | Should the default service role be created? | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | A short description of the project. | `string` | `null` | no |
| <a name="input_encryption_key"></a> [encryption\_key](#input\_encryption\_key) | The AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build project's build output artifacts. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Information about the project's build environment. | `any` | `{}` | no |
| <a name="input_environment_certificate"></a> [environment\_certificate](#input\_environment\_certificate) | The ARN of the S3 bucket, path prefix and object key that contains the PEM-encoded certificate. | `string` | `null` | no |
| <a name="input_environment_compute_type"></a> [environment\_compute\_type](#input\_environment\_compute\_type) | Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute\_type need to be `BUILD_GENERAL1_LARGE`. | `string` | `"BUILD_GENERAL1_MEDIUM"` | no |
| <a name="input_environment_image"></a> [environment\_image](#input\_environment\_image) | The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`) | `string` | `"aws/codebuild/amazonlinux2-x86_64-standard:3.0"` | no |
| <a name="input_environment_image_pull_credentials_type"></a> [environment\_image\_pull\_credentials\_type](#input\_environment\_image\_pull\_credentials\_type) | The type of credentials AWS CodeBuild uses to pull images in your build. Available values for this parameter are `CODEBUILD` or `SERVICE_ROLE`. When you use a cross-account or private registry image, you must use SERVICE\_ROLE credentials. When you use an AWS CodeBuild curated image, you must use CODEBUILD credentials. | `string` | `"CODEBUILD"` | no |
| <a name="input_environment_privileged_mode"></a> [environment\_privileged\_mode](#input\_environment\_privileged\_mode) | If set to true, enables running the Docker daemon inside a Docker container. | `bool` | `false` | no |
| <a name="input_environment_registry_credential"></a> [environment\_registry\_credential](#input\_environment\_registry\_credential) | Information about credentials for access to a private Docker registry. Registry Credential config blocks are documented below. | `map(any)` | `{}` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | The type of build environment to use for related builds. Available values are: `LINUX_CONTAINER`, `LINUX_GPU_CONTAINER`, `WINDOWS_CONTAINER` or `ARM_CONTAINER`. | `string` | `"LINUX_CONTAINER"` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A list of sets of environment variables to make available to builds for this build project. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The projects name. | `string` | n/a | yes |
| <a name="input_queued_timeout"></a> [queued\_timeout](#input\_queued\_timeout) | How long in minutes, from 5 to 480 (8 hours), a build is allowed to be queued before it times out.The default is 8 hours. | `number` | `480` | no |
| <a name="input_s3_logs"></a> [s3\_logs](#input\_s3\_logs) | Configuration for the builds to store log data to S3. | `any` | `{}` | no |
| <a name="input_s3_logs_encryption_disabled"></a> [s3\_logs\_encryption\_disabled](#input\_s3\_logs\_encryption\_disabled) | Set to true if you do not want S3 logs encrypted. | `string` | `true` | no |
| <a name="input_s3_logs_location"></a> [s3\_logs\_location](#input\_s3\_logs\_location) | The name of the S3 bucket and the path prefix for S3 logs. Must be set if status is ENABLED, otherwise it must be empty. | `string` | `null` | no |
| <a name="input_s3_logs_status"></a> [s3\_logs\_status](#input\_s3\_logs\_status) | Current status of logs in S3 for a build project. Valid values: `ENABLED`, `DISABLED.` | `string` | `"DISABLED"` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | A predefined service role to be used | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | Configuration for the builds to run inside a VPC. | `any` | `{}` | no |
| <a name="input_vpc_config_security_group_ids"></a> [vpc\_config\_security\_group\_ids](#input\_vpc\_config\_security\_group\_ids) | The security group IDs to assign to running builds. | `list(string)` | `[]` | no |
| <a name="input_vpc_config_subnets"></a> [vpc\_config\_subnets](#input\_vpc\_config\_subnets) | The subnet IDs within which to run builds. | `list(string)` | `[]` | no |
| <a name="input_vpc_config_vpc_id"></a> [vpc\_config\_vpc\_id](#input\_vpc\_config\_vpc\_id) | The ID of the VPC within which to run builds. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the CodeBuild project |
| <a name="output_id"></a> [id](#output\_id) | The name (if imported via name) or ARN (if created via Terraform or imported via ARN) of the CodeBuild project. |
| <a name="output_name"></a> [name](#output\_name) | The name of the CodeBuild project |
| <a name="output_service_role_arn"></a> [service\_role\_arn](#output\_service\_role\_arn) | Amazon Resource Name (ARN) of the Service Role for CodeBuild. |
| <a name="output_service_role_id"></a> [service\_role\_id](#output\_service\_role\_id) | ID of the Service Role created for CodeBuild. |
| <a name="output_service_role_name"></a> [service\_role\_name](#output\_service\_role\_name) | Name of the Service Role created for CodeBuild. |
<!-- END_TF_DOCS -->