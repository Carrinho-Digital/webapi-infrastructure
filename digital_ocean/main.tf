resource "digitalocean_vpc" "carrinho_vpc" {
  name     = "carrinhodigital_vpc"
  region   = var.region
  ip_range = var.ip_range
}
