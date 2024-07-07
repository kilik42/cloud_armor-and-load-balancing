

#create a vm
resource "google_compute_instance" "vm_instance_cloud_armor" {
  name = "vm-instance_cloud_armor"
  machine_type = "e2-micro"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network_cloud_armor.name
    subnetwork = google_compute_subnetwork.subnet_cloud_armor.name
    access_config {

    }
  }

  #startupscript
}




