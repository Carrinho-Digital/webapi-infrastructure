resource "digitalocean_vpc" "carrinho_vpc" {
  name     = "carrinhodigital-vpc"
  region   = var.region
  ip_range = var.ip_range
}

resource "digitalocean_kubernetes_cluster" "kubernetes_prod_cluster" {
  name     = "kubernetes_prod_cluster"
  region   = var.region
  version  = "1.17.5-do.0"
  vpc_uuid = digitalocean_vpc.carrinho_vpc.id
  tags     = ["prod", "webapi"]

  node_pool {
    name       = "worker_pool"
    size       = "s-1vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    tags       = ["prod", "workers"]
    max_nodes  = 3
  }
}
