resource "google_compute_instance_template" "unmanaged_instance_template" {
  name         = "unmanaged-instance-template"
  machine_type = "e2-medium"

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    disk_size_gb = 100
    boot         = true
  }

  network_interface {
    network = google_compute_network.vpc_network_cloud_armor.self_link
    subnetwork = google_compute_subnetwork.subnet_cloud_armor.self_link
  }

  metadata = {
    foo = "bar"
  }

  can_ip_forward = true
}

output "instance_template" {
  value = google_compute_instance_template.unmanaged_instance_template.self_link
}