project_id = "my-cloud-giulio"
cluster_name="dev-v1"
region     = "europe-west1"
gke_num_nodes = 1
// exceed regional limit and I'm not eligible to ask increase
// machine_type="n2d-standard-4"

// usage example
// export DB_USERNAME=dbapp 
// TF_VAR_DB_PASSWORD=$DB_PASSWORD TF_VAR_DB_USERNAME=$DB_USERNAME terraform apply
