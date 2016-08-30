// resource "google_compute_http_health_check" "testing-monitoring-health-check" {
//   name         = "test-o-monitoring-health-check"
//   request_path = "/health_check"
//
//   timeout_sec        = 1
//   check_interval_sec = 1
// }
//
// resource "google_compute_backend_service" "testing-monitoring" {
//   name        = "blablah"
//   description = "Hello World 1234"
//   port_name   = "http"
//   protocol    = "HTTP"
//   timeout_sec = 10
//
//   backend {
//     group = "${google_compute_instance_group_manager.testing-elastic-monitoring.instance_group}"
//   }
//
//   health_checks = ["${google_compute_http_health_check.default.self_link}"]
// }
