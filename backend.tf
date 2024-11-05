##########################################################
# Copyright 2023 Google LLC.
# This software is provided as-is, without warranty or
# representation for any use or purpose.
# Your use of it is subject to your agreement with Google.
#
# Sample Terraform script to spin up a backend for Terraform
##########################################################

##########################################################
### Store Terraform state on a Cloud Storage bucket (optional)
##########################################################
/*
terraform {
  backend "gcs" {
    bucket = "bucket-name"
    prefix = "terraform/apigee/non-prd/apigee-org/state"
  }
}
*/
#
##IMPORTANT: The bucket must be created before attempting to
##provision this IaC snippet. Check the following configurations:
##1)Bucket name
##2)Make it non-public
##3)Enable object versioning on the bucket