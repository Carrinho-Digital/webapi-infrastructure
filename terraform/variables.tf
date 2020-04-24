variable "project-id" {
  type = string
}

variable "credential" {
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

variable "image_name" {
  type    = string
  default = "webapi"
}

variable "image_version" {
  type    = string
  default = "0.1"
}
