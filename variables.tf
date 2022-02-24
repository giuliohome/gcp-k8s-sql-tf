variable "db_instance" {
  description = "The name of the SQL Database instance"
}

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
  default     = 2
  description = "number of gke nodes"
}

variable "DB_USERNAME" {
  description = "db username as well as database"
}

variable "DB_PASSWORD" {
  description = "db password"
}
