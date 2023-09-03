terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "2.19.0"
    }
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200"
  token   = "hvs.imUkaahUWuahk9v4rjPs36mK"
}

data "vault_generic_secret" "demo" {
  path = "secrets/db-creds"
}

output "vault_secret" {
  value     = data.vault_generic_secret.demo.data_json
  sensitive = true
}
