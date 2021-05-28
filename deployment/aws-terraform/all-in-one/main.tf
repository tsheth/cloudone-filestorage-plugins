terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_cloudformation_stack" "fss-allinone-by-tf" {
  name = "fss-allinone-stack-by-tf"
  capabilities = ["CAPABILITY_IAM"]

  parameters = {
    S3BucketToScan = "",
    CloudOneRegion = "us-east-1",
    ExternalID = ""
  }

  template_url="https://file-storage-security.s3.amazonaws.com/latest/templates/FSS-All-In-One.template"

}

output "CFT_ALLINONE_OUTPUTS" {
  description = "Outputs from CFT"
  value       = aws_cloudformation_stack.fss-allinone-by-tf.outputs
}
