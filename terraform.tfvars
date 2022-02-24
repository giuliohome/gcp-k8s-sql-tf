project_id = "gke-sql-tf"
cluster_name="dev-v1"
region     = "us-central1"
gke_num_nodes = 1
db_instance = "mypostgres-byterraform"

// usage example
// export DB_USERNAME=dbapp 
// TF_VAR_DB_PASSWORD=$DB_PASSWORD TF_VAR_DB_USERNAME=$DB_USERNAME terraform apply
