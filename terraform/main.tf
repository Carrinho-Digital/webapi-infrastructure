provider "google" {
  credentials = file("${var.credential}")
  project     = var.project-id
  region      = var.region
}

terraform {
  backend "remote" {
    organization = "eclesiomelo"

    workspaces {
      name = "webapi"
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "${var.env}-webapi-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_address" "gce_static_ip" {
  name = "ipv4-address"
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "${var.env}-webapi-subnet"
  region                   = var.region
  private_ip_google_access = true
  ip_cidr_range            = "10.1.0.0/16"
  network                  = google_compute_network.vpc_network.self_link
}

resource "google_compute_firewall" "ingress_firewall" {
  name    = "${var.env}-webapi-ingress-firewall"
  network = google_compute_network.vpc_network.self_link

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports = [
      22,
      80,
      443,
      8080,
      8443,
      27017,
    ]
  }

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_instance" "webapi_instance" {
  name         = "webapi-instance"
  zone         = var.zone
  machine_type = var.machine_type

  tags = [
    "${var.env}",
    "${var.env}-gce-instance"
  ]

  boot_disk {
    initialize_params {
      image = "${var.project-id}/${terraform.workspace}-${var.image_name}-${var.image_version}"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link

    access_config {
      nat_ip = google_compute_address.gce_static_ip.address
    }
  }
}

output "instace_external_ip" {
  value = google_compute_instance.webapi_instance.network_interface.0.access_config.0.nat_ip
}
