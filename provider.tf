terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.8.0"
    }
  }
}


provider "google" {
  region      = "asia-south2"
  project     = "tcb-project-371706"
  credentials = file("tcb-project-371706-b114ce01e529.json")
  zone        = "asia-south2-a"

}