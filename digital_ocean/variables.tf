variable "tf-organization" {
  type = string
}

variable "tf-hostname" {
  type = string
}

variable "tf-prefix" {
  type = string
}

variable "digital_ocean_project" {
  type    = string
  default = "carrinhodigital"
}

variable "digital_ocean_token" {
  type = string
}

variable "digital_ocean_region_sfo1" {
  type = string
}

variable "digital_ocean_region_sfo3" {
  type = string
}

variable "vpc_sfo1_ip_range" {
  type = string
}

variable "vpc_sfo3_ip_range" {
  type = string
}
