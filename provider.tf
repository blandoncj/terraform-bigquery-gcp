terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  credentials = file("keys/gcp-key.json")
  project     = "tactile-alloy-478303-t8" 
  region      = "us-central1"
}
