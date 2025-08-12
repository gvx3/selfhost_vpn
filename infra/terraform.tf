terraform {
  cloud { #HCP Terraform
    organization = "gvx3"

    workspaces {
      name = "minhvu"
    }
  }

  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.8.0"
    }
  }
  required_version = "~>1.12.0"
}

provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  region       = var.region
}

