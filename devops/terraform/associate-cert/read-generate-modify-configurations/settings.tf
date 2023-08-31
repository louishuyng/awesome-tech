terraform {
  required_version = "> 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 2.0"
    }
    kube = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.11"
    }
  }
}
