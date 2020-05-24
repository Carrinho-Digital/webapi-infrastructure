resource "digitalocean_vpc" "carrinho_vpc" {
  name     = "carrinhodigital-vpc"
  region   = var.region
  ip_range = var.ip_range
}
