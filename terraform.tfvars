##########################################################
# Copyright 2024 Google LLC.
# This software is provided as-is, without warranty or
# representation for any use or purpose.
# Your use of it is subject to your agreement with Google.
#
# Sample Terraform script to set up variable names 
##########################################################
host_project_id = ""
service_project_id = "apigee-non-prd-cpl-rep"# name of the service project
apigee_services_list = ["apigee.googleapis.com",
"compute.googleapis.com",
"servicenetworking.googleapis.com",
"cloudkms.googleapis.com"]
analytics_region = "southamerica-west1"
instance_region = "southamerica-east1"
instance_ip_range="10.200.0.0/22" #IP range address for the apigee instance. I.e: x.x.x.x/22
apigee_instance_range="10.200.0.0" #IP address will have the instance from the range /22. Do not add /22
apigee_support_range="10.200.4.0"  #IP range for troubleshooting from the range /28. Do not add /28
apigee_environment_group_dev= "api-dev-copel"
apigee_environment_dev_01= "dev-1"
apigee_environment_dev_02= "dev-2"
apigee_environment_group_hml= "api-hml-copel"
apigee_environment_hml_1= "hml-1"
apigee_environment_hml_2= "hml-2"
apigee_network = "" #Name of the VPC Network. 
apigee_subnetwork = "" #name of the PSC Apigee Subnetwork
xlb_name = "elb-l7-apx-non-prd"
