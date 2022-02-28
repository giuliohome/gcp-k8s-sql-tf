output "private_ip_address" {
  description = "The public IPv4 address of the master instance."
  value       = google_sql_database_instance.instance.private_ip_address
}
