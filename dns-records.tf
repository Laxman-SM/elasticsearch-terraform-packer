resource "google_dns_managed_zone" "dev-elastic-test" {
  name = "dev-elastic-test"
  dns_name = "quotecenter.net."
  description = "The development range of quotecenter.net."
}

resource "google_dns_record_set" "testing-elastic-1" {
  managed_zone = "${google_dns_managed_zone.dev-elastic-test.name}"
  name = "testing-elastic-1.${google_dns_managed_zone.dev-elastic-test.dns_name}"
  type = "A"
  ttl = 5
  rrdatas = [
    "${google_compute_instance.testing-elastic-1.network_interface.0.access_config.0.assigned_nat_ip}"]
}

// resource "google_dns_record_set" "testing-elastic-2" {
//   managed_zone = "${google_dns_managed_zone.dev-elastic-test.name}"
//   name = "testing-elastic-2.${google_dns_managed_zone.dev-elastic-test.dns_name}"
//   type = "A"
//   ttl = 5
//   rrdatas = [
//     "${google_compute_instance.testing-elastic-2.network_interface.0.access_config.0.assigned_nat_ip}"]
// }

// resource "google_dns_record_set" "testing-elastic-3" {
//   managed_zone = "${google_dns_managed_zone.dev-elastic-test.name}"
//   name = "testing-elastic-3.${google_dns_managed_zone.dev-elastic-test.dns_name}"
//   type = "A"
//   ttl = 5
//   rrdatas = [
//     "${google_compute_instance.testing-elastic-3.network_interface.0.access_config.0.assigned_nat_ip}"]
// }

// resource "google_dns_record_set" "testing-elastic-4" {
//   managed_zone = "${google_dns_managed_zone.dev-elastic-test.name}"
//   name = "testing-elastic-4.${google_dns_managed_zone.dev-elastic-test.dns_name}"
//   type = "A"
//   ttl = 5
//   rrdatas = [
//     "${google_compute_instance.testing-elastic-4.network_interface.0.access_config.0.assigned_nat_ip}"]
// }
