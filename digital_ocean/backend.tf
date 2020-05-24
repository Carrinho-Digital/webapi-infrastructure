terraform {
  backend "remote" {
    organization = var.tf-organization
    hostname     = var.tf-hostname

    workspaces {
      prefix = var.tf-prefix
    }
  }
}
