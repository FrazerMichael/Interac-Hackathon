terraform {
  cloud {
    # The name of your Terraform Cloud organization.
    organization = "Michaelfrazer-demo"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "GithubAction"
    }
  }
}

locals {
  cluster-name = "SDN-Terraform-Lab3"
  key-name     = "KeyS144"
}

module "vpc" {
  source = "github.com/FrazerMichael/Terraform-Modules//aws-vpc"

  cluster      = local.cluster-name
  cidr-block   = "10.0.0.0/24"
  public-cidr  = "10.0.0.0/25"
  private-cidr = "10.0.0.128/25"
  azs          = ["us-east-1a", "us-east-1b"]
}
