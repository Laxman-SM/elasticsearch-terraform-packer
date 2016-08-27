resource "google_compute_instance_group" "monitoring-testing" {
  name = "testing-elastic-monitoring"
  description = "Terraform test instance group"

  instances = [
    "${google_compute_instance.testing-elastic-1.self_link}"
    /*,
    "${google_compute_instance.testing-elastic-2.self_link}",
    "${google_compute_instance.testing-elastic-3.self_link}",
    "${google_compute_instance.testing-elastic-4.self_link}"*/
  ]

  named_port {
    name = "http"
    port = "9200"
  }

  named_port {
    name = "https"
    port = "9200"
  }

  zone = "us-central1-a"
}