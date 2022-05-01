variable "project_id" {
  description = "project id"
}

variable "cluster_name" {
  description = "The name of the cluster"
  default     = "dev"
}

variable "region" {
  description = "region"
}

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 4
  description = "number of gke nodes"
}

variable "machine_type" {
  default="n2-standard-2"
}