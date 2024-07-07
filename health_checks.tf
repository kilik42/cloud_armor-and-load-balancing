resource "google_compute_http_health_check" "health_check" {
  name = "health-check"
  check_interval_sec = 1
  timeout_sec = 1
  healthy_threshold = 1
  unhealthy_threshold = 1
  port = 80
  request_path = "/"
}

output "health_check" {
  value = google_compute_http_health_check.health_check.self_link
}