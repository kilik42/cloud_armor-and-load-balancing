#need to create a vpc network 
resource "google_compute_network" "vpc_network_cloud_armor" {
  name = "vpc-network"
  auto_create_subnetworks = false
}
#create subnetwork
resource "google_compute_subnetwork" "subnet_cloud_armor" {
  name = "subnet-cloud-armor"
  ip_cidr_range = "10.1.0.0/20"
  region = "us-central1"
  network = google_compute_network.vpc_network_cloud_armor.self_link

  }

  output "subnetwork" {
    value = google_compute_subnetwork.subnet_cloud_armor.self_link
  }

  output "network" {
    value = google_compute_network.vpc_network_cloud_armor.self_link
  }