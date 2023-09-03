provider "aws" {
  region  = "us-east-1"
  profile = "louisdev"
}

provider "aws" {
  alias   = "louisprd-singapore"
  region  = "ap-southeast-1"
  profile = "louisprd"
}

provider "aws" {
  alias   = "louisdev-singapore"
  region  = "ap-southeast-1"
  profile = "louisdev"
}
