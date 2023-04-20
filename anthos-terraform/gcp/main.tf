provider "google" {
    credentials = "${file("terraform-gcp-384015-ff3fdaeb19ee.json")}"
    project = "terraform-gcp-384015"
    region  = "asia-east2"
    zone    = "asia-east2-a"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"


  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"

  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.service_account
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}