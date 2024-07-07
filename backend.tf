resource "google_compute_backend_service" "backend_service" {
  name = "backend-service"
  project = "terraf-392514"
  backend {
    group = google_compute_instance_group.instance_group_cloud_armor.self_link
  }
  health_checks = [google_compute_http_health_check.health_check.self_link]
  load_balancing_scheme = "INTERNAL"
  protocol = "HTTP"
  timeout_sec = 10
  port_name = "http"
  connection_draining_timeout_sec = 60
  enable_cdn = false
  session_affinity = "NONE"
  locality_lb_policy = "ROUND_ROBIN"

  security_policy = google_compute_security_policy.cloud_armor_rule.self_link
}



output "backend_service" {
  value = google_compute_backend_service.backend_service.self_link
}

