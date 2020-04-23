variable "project-id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "env" {
  type    = string
  default = "dev"
}
