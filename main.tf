provider "google" {
  project     = "stone-bongo-319012" # Nom projet GCP
  region      = "us-central1" 
  credentials = file("./stone-bongo-319012-a581a55821d0.json") # Clé pour login
}


resource "google_container_cluster" "cluster1" { #Créer cluster , default = id cluster
  name               = "projet-infra-helder1" # Nom à choisir
  location           = "europe-central2-a"
  initial_node_count = 3
  
}

resource "google_container_node_pool" "cluster1" {
  name       = "${var.name}-node-pool"
  project    = var.project
  location   = var.location
  cluster    = google_container_cluster.cluster1.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# resource "helm_release" "prometheus" {
#   name       = "prometheus"
#   repository = "https://charts.bitnami.com/bitnami/kube-prometheus-stack"
#   chart      = "redis"
#   version    = "6.0.1"

#   values = [
#     "${file("values.yaml")}"
#   ]

#   set {
#     name  = "cluster.enabled"
#     value = "true"
#   }

#   set {
#     name  = "metrics.enabled"
#     value = "true"
#   }

#   set {
#     name  = "service.annotations.prometheus\\.io/port"
#     value = "9127"
#     type  = "string"
#   }
# }




