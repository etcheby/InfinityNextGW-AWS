terraform {
  backend "remote" {
    organization = "pradel"

    workspaces {
      name = "Infinity-NextGW"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}