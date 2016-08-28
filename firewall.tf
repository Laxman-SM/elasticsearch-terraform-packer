resource "google_compute_firewall" "elasticsearch" {
  name    = "elasticsearch"
  network = "default"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "tcp"
    ports    = ["9200"]
  }

  target_tags = ["elasticsearch"]
}
