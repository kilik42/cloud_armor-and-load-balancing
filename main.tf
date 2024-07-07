terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.35.0"
    }
  }
}

provider "google" {
  credentials = "labKey.json"
  project = "terraf-392514"
  region  = "us-central1"
}

