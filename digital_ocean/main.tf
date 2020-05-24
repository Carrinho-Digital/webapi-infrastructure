resource "digitalocean_vpc" "carrinho_vpc" {
  name     = "carrinhodigital-vpc"
  region   = var.digital_ocean_region_sfo1
  ip_range = var.vpc_sfo1_ip_range
}

resource "digitalocean_vpc" "carrinho_sfo3_vpc" {
  name     = "carrinhodigital-sfo3-vpc"
  region   = var.digital_ocean_region_sfo3
  ip_range = var.vpc_sfo3_ip_range
}

resource "digitalocean_kubernetes_cluster" "kubernetes_prod_cluster" {
  name     = "kubernetes-prod-cluster"
  region   = var.digital_ocean_region_sfo3
  version  = "1.17.5-do.0"
  vpc_uuid = digitalocean_vpc.carrinho_sfo3_vpc.id
  tags     = ["prod", "webapi"]

  node_pool {
    name       = "worker-pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    tags       = ["prod", "worker"]
    max_nodes  = 3
  }
}
