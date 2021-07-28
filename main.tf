provider "google" {
  project     = "stone-bongo-319012" # Nom projet GCP
  region      = "europe-central2" 
  credentials = file("./stone-bongo-319012-a581a55821d0.json") # Clé pour login
}


resource "google_container_cluster" "cluster1" { #Créer cluster , default = id cluster
  name               = var.project # Nom à choisir
  location           = var.location
  initial_node_count = var.initial_node_count
  
}

# Créer compte de service

# resource "google_service_account" "myaccount" {
#   account_id   = "myaccount"
#   display_name = "My Service Account"
# }

# resource "google_service_account_key" "mykey" {
#   service_account_id = google_service_account.myaccount.name
#   public_key_type    = "TYPE_X509_PEM_FILE"
# }

# resource "helm_release" "prometheus" {
#    name       = "prometheus"
#    repository = "https://charts.bitnami.com/bitnami/"
#    chart      = "kube-prometheus"

#    set {
#      name  = "cluster.enabled"
#      value = "true"
#    }

#    set {
#      name  = "metrics.enabled"
#      value = "true"
#    }

#    set {
#      name  = "service.annotations.prometheus\\.io/port"
#      value = "9127"
#      type  = "string"
#    }
#  }

#kubectl apply -f mon_nom_ficher_yaml





