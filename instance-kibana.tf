# Kibana Reports Server
resource "google_compute_instance" "reports" {
  name = "reports"
  machine_type = "${var.machine_type}"
  tags = [
    "http-server",
    "https-server",
    "default-allow-ssh"]

  zone = "us-west1-a"

  disk {
    image = "${var.image_kibana}"
    size = 255
  }

  network_interface {
    subnetwork = "default"
    access_config {     }
  }

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}
