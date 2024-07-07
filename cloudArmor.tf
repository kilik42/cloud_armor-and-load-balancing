#create cloud armor security policy

# resource "google_compute_security_policy" "cloud_armor" {
#   name = "cloud-armor"
#   description = "Cloud Armor security policy"
#   project = var.project_id
#   security_policy = {
#     # block requests from a specific IP address
#     # block_ip_address = {
#     #   deny = {
#     #     deny_mode = "DENY_ALL"
#     #     rules = {
#     #       match = {
#     #         config = {
#     #           src_ip_ranges = ["

# resource policy 
 resource "google_compute_security_policy" "cloud_armor_rule" {

    name = "cloud-armor-rule"
    description = "allow all traffic"
    rule {
        action = "allow"
        priority = 1000
        match {
            versioned_expr = "SRC_IPS_V1"
            config  {
                src_ip_ranges = ["0.0.0.0/0"]
            }
        }
        description = "allow all traffic"
    }

    rule {
        action = "deny(403)"
        priority = 2000
        match {
            versioned_expr = "SRC_IPS_V1"
            config {
                src_ip_ranges = ["*"]   
            }
        }
        description = "deny all traffic"

 }