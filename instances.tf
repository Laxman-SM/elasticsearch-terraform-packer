# For ssh provisioning.
variable "private_ssh_key" {}

# Elasticsearch One
resource "google_compute_instance" "testing-elastic-1" {
  name = "testing-elastic-1"
  machine_type = "n1-standard-4"
  tags = [
    "http-server",
    "https-server",
    "dev-elastic",
    "dev-ssh"]

  zone = "us-central1-a"

  disk {
    image = "${var.image}"
    size = 512
  }

  network_interface {
    subnetwork = "devcentral"
    access_config {
    }
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${google_compute_instance.testing-elastic-1.network_interface.0.access_config.0.assigned_nat_ip}"]

    connection {
      type = "ssh"
      private_key = "${file("~/.ssh/id_rsa")}" # "${var.private_ssh_key}"
      timeout = "45s"
    }
  }

  // provisioner "file" {
  //   source = "tf-scripts/create-elastic-yaml.sh"
  //   destination = "create-elastic-yaml.sh"
  //   connection {
  //     key_file = "${file("~/.ssh/google_compute_engine")}"
  //   }
  // }

  // provisioner "local-exec" {
  //   command = "echo 'blurp'"
  // }

  // provisioner "file" {
  //   source = "tf-scripts/setup-elastic.sh"
  //   destination = "setup-elastic.sh"
  //   connection {
  //     type = "ssh"
  //     user = "root"
  //     private_key = "${file("~/.ssh/google_compute_engine")}"
  //   }
  // }
  //

  service_account {
    scopes = [
      "userinfo-email",
      "compute-ro",
      "storage-ro"]
  }
}

 // # Elasticsearch Two
 // resource "google_compute_instance" "testing-elastic-2" {
 //   name = "testing-elastic-2"
 //   machine_type = "n1-standard-4"
 //   tags = [
 //     "http-server",
 //     "https-server",
 //     "dev-elastic",
 //     "dev-ssh"]
 //
 //   zone = "us-central1-a"
 //
 //   disk {
 //     image = "${var.image}"
 //     size = 512
 //   }
 //
 //   network_interface {
 //     subnetwork = "devcentral"
 //     access_config {
 //     }
 //   }
 //
 //   provisioner "file" {
 //     source = "tf-scripts/create-elastic-yaml.sh"
 //     destination = "create-elastic-yaml.sh"
 //     connection {
 //       type = "ssh"
 //       user = "root"
 //       private_key = "${file("~/.ssh/google_compute_engine")}"
 //     }
 //   }
 //
 //   provisioner "file" {
 //     source = "tf-scripts/setup-elastic.sh"
 //     destination = "setup-elastic.sh"
 //     connection {
 //       type = "ssh"
 //       user = "root"
 //       private_key = "${file("~/.ssh/google_compute_engine")}"
 //     }
 //   }
 //
 //   provisioner "remote-exec" {
 //     inline = [
 //       "chmod +x /setup-elastic.sh",
 //       "/setup-elastic.sh",
 //       "echo ${google_compute_instance.testing-elastic-1.network_interface.0.access_config.0.assigned_nat_ip}"]
 //       connection {
 //         type = "ssh"
 //         user = "root"
 //         private_key = "${file("~/.ssh/google_compute_engine")}"
 //       }
 //   }
 //
 //   service_account {
 //     scopes = [
 //       "userinfo-email",
 //       "compute-ro",
 //       "storage-ro"]
 //   }
 // }
 //
 // # Elasticsearch Three
 // resource "google_compute_instance" "testing-elastic-3" {
 //   name = "testing-elastic-3"
 //   machine_type = "n1-standard-4"
 //   tags = [
 //     "http-server",
 //     "https-server",
 //     "dev-elastic",
 //     "dev-ssh"]
 //
 //   zone = "us-central1-a"
 //
 //   disk {
 //     image = "${var.image}"
 //     size = 512
 //   }
 //
 //   network_interface {
 //     subnetwork = "devcentral"
 //     access_config {
 //     }
 //   }
 //
 //   provisioner "file" {
 //     source = "tf-scripts/create-elastic-yaml.sh"
 //     destination = "create-elastic-yaml.sh"
 //     connection {
 //       type = "ssh"
 //       user = "root"
 //       private_key = "${file("~/.ssh/google_compute_engine")}"
 //     }
 //   }
 //
 //   provisioner "file" {
 //     source = "tf-scripts/setup-elastic.sh"
 //     destination = "setup-elastic.sh"
 //     connection {
 //       type = "ssh"
 //       user = "root"
 //       private_key = "${file("~/.ssh/google_compute_engine")}"
 //     }
 //   }
 //
 //   provisioner "remote-exec" {
 //     inline = [
 //       "chmod +x /setup-elastic.sh",
 //       "/setup-elastic.sh",
 //       "echo ${google_compute_instance.testing-elastic-1.network_interface.0.access_config.0.assigned_nat_ip}"]
 //       connection {
 //         type = "ssh"
 //         user = "root"
 //         private_key = "${file("~/.ssh/google_compute_engine")}"
 //       }
 //   }
 //
 //   service_account {
 //     scopes = [
 //       "userinfo-email",
 //       "compute-ro",
 //       "storage-ro"]
 //   }
 // }

 // # Elasticsearch Four
 // resource "google_compute_instance" "testing-elastic-4" {
 //   name = "testing-elastic-4"
 //   machine_type = "n1-standard-4"
 //   tags = [
 //     "http-server",
 //     "https-server",
 //     "dev-elastic",
 //     "dev-ssh"]
 //
 //   zone = "us-central1-a"
 //
 //   disk {
 //     image = "${var.image}"
 //     size = 512
 //   }
 //
 //   network_interface {
 //     subnetwork = "devcentral"
 //     access_config {
 //     }
 //   }
 //   provisioner "file" {
 //     source = "tf-scripts/create-elastic-yaml.sh"
 //     destination = "create-elastic-yaml.sh"
 //   }
 //
 //   provisioner "file" {
 //     source = "tf-scripts/setup-elastic.sh"
 //     destination = "setup-elastic.sh"
 //   }
 //
 //   provisioner "remote-exec" {
 //        inline = ["setup-elastic.sh",
 //        "echo ${google_compute_instance.testing-elastic-1.network_interface.0.access_config.0.assigned_nat_ip}"]
 //   }
 //   service_account {
 //     scopes = [
 //       "userinfo-email",
 //       "compute-ro",
 //       "storage-ro"]
 //   }
 // }
 //
 //
 // # Elasticsearch One
 // resource "google_compute_instance" "testing-kibana-server" {
 //   name = "testing-kibana-server"
 //   machine_type = "n1-standard-4"
 //   tags = [
 //     "http-server",
 //     "https-server",
 //     "dev-ssh"]
 //
 //   zone = "us-central1-a"
 //
 //   disk {
 //     image = "${var.kibana_image}"
 //     size = 255
 //   }
 //
 //   network_interface {
 //     subnetwork = "devcentral"
 //     access_config {
 //       nat_ip = "${google_compute_address.testing-kibana-report-server.address}"
 //     }
 //   }
 //
 //   service_account {
 //     scopes = [
 //       "userinfo-email",
 //       "compute-ro",
 //       "storage-ro"]
 //   }
 // }
