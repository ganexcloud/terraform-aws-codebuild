provider "aws" {
  region = "us-east-1"
}

module "codebuild" {
  source = "../../"
  name   = "project-name"
  #codebuild_source = {
  #  type = "CODEPIPELINE"
  #}
  #codebuild_source_s3_bucket_name = module.codepipeline.bucket_name
  environment = {
    compute_type    = "BUILD_GENERAL1_SMALL"
    privileged_mode = true
    variables = [
      {
        name  = "AWS_REGION"
        value = "us-east-1"
      },
      {
        name  = "AWS_ACCOUNT_ID"
        value = "XXXXXX"
      }
    ]
  }
}
