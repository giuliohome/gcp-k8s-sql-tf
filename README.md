# gcp-k8s-sql-tf

This is an infrastructure fully created by Terraform and Kubernetes on Google Cloud with a Postgres SQL service.

The source of the application is in a [separate repository](https://github.com/giuliohome/Flask-SqlServer-GoogleKubernetesEngine) (originally for Pulumi and here fully ported to Terraform)

Notice that the sql instance has a **private ip** and the Kubernetes Cluster has **VPC-native traffic** routing enabled.
