# Elasticsearch One
resource "google_compute_instance" "elastic-node-1" {
  name = "elastic-node-1"
  machine_type = "${var.machine_type}"
  tags = [
    "http-server",
    "https-server",
    "dev-elastic",
    "default-allow-ssh"]

  zone = "us-west1-a"

  disk {
    image = "${var.image_elastic}"
    size = 512
  }

  network_interface {
    subnetwork = "default"
    access_config {  }
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${google_compute_instance.elastic-node-1.network_interface.0.access_config.0.assigned_nat_ip}"]

    connection {
      type = "ssh"
      private_key = "${var.private_ssh_key}"
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

 # Elasticsearch One
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
