
resource "google_sql_database_instance" "instance" {
  name             = var.db_instance
  region           = var.region
  database_version = "POSTGRES_13"

  depends_on = [google_service_networking_connection.private_vpc_connection]
  
  settings {
    tier = "db-f1-micro"
    availability_type = "ZONAL"
    
    ip_configuration {
      ipv4_enabled    = false 
      
      private_network =  "projects/${var.project_id}/global/networks/default"
        
      }
    
  }
  
  deletion_protection  = "false"
} 


resource "google_sql_database" "database" {
  name     = var.DB_USERNAME
  instance = google_sql_database_instance.instance.name
  depends_on  = [
    google_sql_database_instance.instance,
  ]

}

resource "google_sql_user" "users" {
  name     = var.DB_USERNAME
  password = var.DB_PASSWORD
  instance = google_sql_database_instance.instance.name
  depends_on  = [
    google_sql_database_instance.instance,
  ]
}
