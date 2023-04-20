# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


output "name" {
  # This may seem redundant with the `name` input, but it serves an important
  # purpose. Terraform won't establish a dependency graph without this to interpolate on.
  description = "The name of the cluster master. This output is used for interpolation with node pools, other modules."

  value = google_container_cluster.primary.name
}

output "master_version" {
  description = "The Kubernetes master version."
  value       = google_container_cluster.primary.master_version
}

output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  value       = google_container_cluster.primary.endpoint
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  sensitive = true
  description = "Public certificate used by clients to authenticate to the cluster endpoint."
  value       = base64decode(google_container_cluster.primary.master_auth[0].client_certificate)
}

output "client_key" {
  sensitive = true
  description = "Private key used by clients to authenticate to the cluster endpoint."
  value       = base64decode(google_container_cluster.primary.master_auth[0].client_key)
}

output "cluster_ca_certificate" {
  sensitive = true
  description = "The public certificate that is the root of trust for the cluster."
  value       = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}