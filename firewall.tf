// resource "google_compute_firewall" "elasticsearch" {
//   name    = "elasticsearch"
//   network = "${google_compute_network.other.name}"
//
//   allow {
//     protocol = "icmp"
//   }
//
//   allow {
//     protocol = "tcp"
//     ports    = ["80", "8080", "1000-2000"]
//   }
//
//   source_tags = ["web"]
// }
