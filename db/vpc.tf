

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_global_address" "private_ip_address" {
  name = "${var.project_id}-${var.db_instance}-private-ip"
  purpose = "VPC_PEERING"
  address_type =  "INTERNAL"
  ip_version   = "IPV4"
  prefix_length = 16
  
  network = "projects/${var.project_id}/global/networks/default"
}


resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = "projects/${var.project_id}/global/networks/default"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
} 
