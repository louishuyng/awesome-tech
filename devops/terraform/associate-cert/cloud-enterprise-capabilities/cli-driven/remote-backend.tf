terraform {
  cloud {
    organization = "louis-devops"
    workspaces {
      name = "remote-operation"
    }
  }
}
