

#need to create a firewall rule
resource "google_compute_firewall" "firewall_cloud_armor" {
  name = "firewall-cloud-armor"
  network = google_compute_network.vpc_network_cloud_armor.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports = ["80", "22"]
  }

  source_tags = ["web"]

  source_ranges = [google_compute_subnetwork.subnet_cloud_armor.ip_cidr_range]

  target_tags = ["web"]
}
