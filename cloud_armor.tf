provider "google" {
  project = "your-google-cloud-project-id"  # Replace with your project ID
  region  = "us-central1"
}

# Create a Cloud Armor security policy
resource "google_compute_security_policy" "block_policy" {
  name        = "block-ip-policy"
  description = "Block requests from specified IP ranges"

  # Define a rule to block requests from a specific IP range
  rule {
    priority    = 1000
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["203.0.113.0/24"]  # Replace with the IP range you want to block
      }
    }
    action = "deny(403)"  # Block the request and return a 403 Forbidden response
  }

  # Define the default rule with a match condition to cover all IP addresses
  rule {
    priority = 2147483647
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]  # Match all IP addresses
      }
    }
    action = "allow"  # Allow all other traffic by default
  }
}
