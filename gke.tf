data "google_client_config" "default" {}







# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-${var.cluster_name}-mytf"
  location = var.region
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  
  network    = "projects/${var.project_id}/global/networks/default"
  # depends_on = [google_compute_subnetwork.vpc]
  subnetwork = "default" # google_compute_subnetwork.vpc.name
  # cluster_ipv4_cidr = "11.58.12.0/28" 
  

  /*private_cluster_config {
      enable_private_nodes = true
      enable_private_endpoint = false
      master_ipv4_cidr_block = "11.58.12.0/28" 
  }*/

  /*ip_allocation_policy {
    cluster_secondary_range_name  = local.cluster_secondary_range_name
    services_secondary_range_name = local.services_secondary_range_name
  }*/
  ip_allocation_policy {
  }


}

# Separately Managed Node Pool
resource "google_container_node_pool" "gke_node_pool" {
  name       = "${var.cluster_name}-node-pool-mytf"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes
  
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-${var.cluster_name}"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
