##########################################################
# Copyright 2024 Google LLC.
# This software is provided as-is, without warranty or
# representation for any use or purpose.
# Your use of it is subject to your agreement with Google.
#
# Sample Terraform script to set up SSL Certificates 
##########################################################

##########################################################
### Create the SSL certificate
##########################################################
###Google Managed certificate
/*resource "google_compute_managed_ssl_certificate" "apigee_cert_dev" {
  project = var.project_id
  name    = "apigee-ssl-dev-certificate"
  managed {
    domains = [local.apigee_hostname_dev]
  }
}


resource "google_compute_managed_ssl_certificate" "apigee_cert_hml" {
  project = var.project_id
  name    = "apigee-ssl-hml-certificate"
  managed {
    domains = [local.apigee_hostname_hml]
  }
}
*/
resource "google_compute_managed_ssl_certificate" "apigee_cert" {
  project = var.service_project_id
  name    = "apigee-ssl-certificate"
  managed {
    domains = [local.apigee_hostname]
  }
}