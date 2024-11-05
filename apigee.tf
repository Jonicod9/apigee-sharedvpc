##########################################################
# Copyright 2023 Google LLC.
# This software is provided as-is, without warranty or
# representation for any use or purpose.
# Your use of it is subject to your agreement with Google.
#
# Sample Terraform script to set up an Apigee X Organization 
##########################################################

##########################################################
### Create the Apigee Organization
##########################################################
resource "google_apigee_organization" "apigee_org" {
  project_id                           = var.service_project_id
  analytics_region                     = var.analytics_region
  description                          = "Terraform-provisioned Apigee Org"
  authorized_network                   = var.apigee_network
  retention = "MINIMUM"
  billing_type = "SUBSCRIPTION"
  depends_on = [
    google_service_networking_connection.apigee_vpc_connection
  ]
  lifecycle {
    prevent_destroy = false
  }
}

##########################################################
### Create the Apigee Instance
##########################################################
resource "google_apigee_instance" "apigee_instance" {
  name                     = "instance-1"
  location                 = var.instance_region
  description              = "Terraform-provisioned Apigee Runtime Instance"
  org_id                   = google_apigee_organization.apigee_org.id
  ip_range                = var.instance_ip_range
}

##########################################################
### Create the Apigee Environment
##########################################################
resource "google_apigee_environment" "apigee_environment_dev_01" {
  org_id = google_apigee_organization.apigee_org.id
  name   = var.apigee_environment_dev_01
}

resource "google_apigee_environment" "apigee_environment_dev_02" {
  org_id = google_apigee_organization.apigee_org.id
  name   = var.apigee_environment_dev_02
}

resource "google_apigee_environment" "apigee_environment_hml_1" {
  org_id = google_apigee_organization.apigee_org.id
  name   = var.apigee_environment_hml_1
}

resource "google_apigee_environment" "apigee_environment_hml_2" {
  org_id = google_apigee_organization.apigee_org.id
  name   = var.apigee_environment_hml_2
}

##########################################################
### Attach the Apigee Environment to the Instance
##########################################################
resource "google_apigee_instance_attachment" "envdev1_to_instance_attachment" {
  instance_id = google_apigee_instance.apigee_instance.id
  environment = google_apigee_environment.apigee_environment_dev_01.name
}

resource "google_apigee_instance_attachment" "envdev2_to_instance_attachment" {
  instance_id = google_apigee_instance.apigee_instance.id
  environment = google_apigee_environment.apigee_environment_dev_02.name
}

resource "google_apigee_instance_attachment" "hml1_to_instance_attachment" {
  instance_id = google_apigee_instance.apigee_instance.id
  environment = google_apigee_environment.apigee_environment_hml_1.name
}

resource "google_apigee_instance_attachment" "hml2_to_instance_attachment" {
  instance_id = google_apigee_instance.apigee_instance.id
  environment = google_apigee_environment.apigee_environment_hml_2.name
}

##########################################################
### Create the Apigee Environment Group
##########################################################
resource "google_apigee_envgroup" "apigee_environment_group_dev" {
  org_id    = google_apigee_organization.apigee_org.id
  name      = var.apigee_environment_group_dev
  hostnames = [local.apigee_hostname] ##Your Environment Group hostname
}

resource "google_apigee_envgroup" "apigee_environment_group_hml" {
  org_id    = google_apigee_organization.apigee_org.id
  name      = var.apigee_environment_group_hml
  hostnames = [local.apigee_hostname] ##Your Environment Group hostname
}

##########################################################
### Attach the Apigee Environment to the Environment Group
##########################################################
resource "google_apigee_envgroup_attachment" "envdev1_to_envgroup_attachment" {
  envgroup_id = google_apigee_envgroup.apigee_environment_group_dev.id
  environment = google_apigee_environment.apigee_environment_dev_01.name
}

resource "google_apigee_envgroup_attachment" "envdev2_to_envgroup_attachment" {
  envgroup_id = google_apigee_envgroup.apigee_environment_group_dev.id
  environment = google_apigee_environment.apigee_environment_dev_02.name
}

resource "google_apigee_envgroup_attachment" "envhml1_to_envgroup_attachment" {
  envgroup_id = google_apigee_envgroup.apigee_environment_group_hml.id
  environment = google_apigee_environment.apigee_environment_hml_1.name
}

resource "google_apigee_envgroup_attachment" "envhml2_to_envgroup_attachment" {
  envgroup_id = google_apigee_envgroup.apigee_environment_group_hml.id
  environment = google_apigee_environment.apigee_environment_hml_2.name
}

