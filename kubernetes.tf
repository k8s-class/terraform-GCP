resource "google_container_cluster" "gcp_kubernetes" {
  name               = "${var.cluster_name}"
  zone               = "us-west1-a"
  initial_node_count = "${var.gcp_cluster_count}"
  remove_default_node_pool = true

  node_pool {
    name = "default-pool"
  }

  additional_zones = [
    "us-west1-b",
    "us-west1-c",
  ]

  master_auth {
    username = "${var.linux_admin_username}"
    password = "${var.linux_admin_password}}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      this-is-for = "dev-cluster"
    }

    tags = ["dev", "work"]
  }
}
resource "google_container_node_pool" "primary_pool" {
  name       = "primary-pool"
  cluster    = "${google_container_cluster.gcp_kubernetes.name}"
  zone       = "us-west1-a"
  node_count = "2"

  node_config {
    machine_type = "n1-standard-1"
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 5
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
