provider "google" {
    credentials = "${file("service-account.json")}"
    project = "terraform-gcp-260818"
    region  = "us-central1" 
    zone    = "us-central1-a"
}     

resource "google_compute_instance" "instance" {
    
    ## this is the main command for creating the multiple vm ##
    ## name = "${var.instance-name}-${count.index}" ##
    
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
