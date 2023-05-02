terraform {
  required_version = " >= 0.12"
}
# provider "google" {
#     region = "us-central1"
#     credentials = "${file("service.json")}"
# }
provider "google" {
    region = "us-central1"
}

resource "google_project" "adilet" {
  name = "adilet"
  project_id = "adilet-123"
  billing_account = "013466-1059B8-8B6CA5"
}

resource "null_resource" "cluster" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "gcloud config set project ${google_project.adilet.project_id}"
  }
}

# resource "null_resource" "enable_api" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     command = "gcloud service enable compute.googleapis.com"
#   }
# }


resource "google_project_service" "project" {
  project = "adilet-123"
  service = "compute.googleapis.com"

  disable_dependent_services = true
}


resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

tags = ["foo", "bar"]
#   tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

#   // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }
metadata_startup_script = file("httpd.sh")
  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}

resource "google_compute_firewall" "rules" {
  project     = "adilet-123"
  name        = "my-firewall-rule"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol  = "tcp"
    ports     = ["80", "22", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = []
}