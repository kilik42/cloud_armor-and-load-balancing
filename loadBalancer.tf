#create a load balancer
# resource "google_compute_global_forwarding_rule" "lb" {
#   name = "lb"
#   target = google_compute_target_http_proxy.proxy.self_link
#   port_range = "80"
# }

#google compute global address
resource "google_compute_global_address" "lb_ip" {
  name = "lb-ip"
}

#url map
resource "google_compute_url_map" "url_map" {
  name = "url-map"
  #mapping to the default backend service
  default_service = google_compute_backend_service.backend_service.self_link
}

resource "google_compute_target_http_proxy" "proxy" {
  name = "proxy"
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "lb" {
  name = "lb"
  ip_address = google_compute_global_address.lb_ip.address
  ip_protocol = "TCP"

  target = google_compute_target_http_proxy.proxy.self_link
  port_range = "80"
}

