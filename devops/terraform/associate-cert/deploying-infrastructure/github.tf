terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = "ghp_1234567890abcdefghij" // This is a fake token
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome code"

  visibility = "public"
}
