terraform {
  backend "s3" {
    bucket  = "louis-terraform-demo"
    key     = "project.state"
    region  = "ap-southeast-1"
    profile = "louislab"
  }
}
