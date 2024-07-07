resource "google_compute_instance_group_manager" "instance_group_manager_cloud_armor" {
  name = "instance-group-manager-cloud-armor"
  base_instance_name = "instance-cloud-armor"
  # instance_template  = google_compute_instance_template.unmanaged_instance_template.self_link
  zone = "us-central1-a"
  target_size  = 3

  version {
    name = "v1"
    instance_template = google_compute_instance_template.unmanaged_instance_template.self_link
  }
  named_port {
    name = "http"
    port = 80
  }

  named_port {
    name = "https"
    port = 443
  }
}
















# resource "google_compute_instance_group" "instance_group_cloud_armor" {
#   name        = "instance-group-cloud-armor"
#   description = "Terraform test instance group"
#   zone        = "us-central1-a"

#  instances = [
#     google_compute_instance_template.unmanaged_instance_template.self_link
#   ]

  

#   named_port {
#     name = "http"
#     port = "80"
#   }

#   named_port {
#     name = "https"
#     port = "443"
#   }

 
# }

# resource "google_compute_instance_group_manager" "instance_group_manager_cloud_armor" {
#   name        = "instance-group-manager-cloud-armor"
#   base_instance_name = "instance-group-cloud-armor"
#   instance_group = google_compute_instance_group.instance_group_cloud_armor.self_link
#   target_size = 1
#   zone = "us-central1-a"
# }

