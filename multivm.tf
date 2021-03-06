provider "google" {
    credentials = "${file("service-account.json")}"
    project = "terraform-gcp-268"
    region  = "us-central1"
    zone    = "us-central1-a"
}
resource "google_compute_instance" "instance" {
  name         = "${var.instance-name}-${count.index}"
  machine_type = "f1-micro"
  count        = 3
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
~                                                                        
