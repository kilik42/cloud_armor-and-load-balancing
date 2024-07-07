

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
        priority = 2147483647
        match {
            versioned_expr = "SRC_IPS_V1"
            config {
                src_ip_ranges = ["*"]   
            }
        }
        description = "deny all traffic"

 }
 }