# Provider variables
# sourced from environment variable
variable "user_name" {}
variable "tenant_name" {}
variable "password" {}
variable "auth_url" {}
variable "region" {}

# Image Configuration
variable "image" {
  type    = string
  default = "Ubuntu1804"
}

# Network Configuration
variable "external_network_id" {
  type    = string
  default = "acc4ebf7-aa8d-4527-bade-7539624426c5"
}

variable "external_network_name" {
  type    = string
  default = "public"
}

variable "public-subnet" {
  type    = string
  default = "1e83732d-298b-4dc2-bc51-939076a7b1f9"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

variable "network_cidr" {
  type    = map(string)
  default = {
    subnet_name = "subnet-private"
    cidr        = "192.168.100.0/24"
  }
}

# Flavor instance
variable "flavor_http" {
  type    = string
  default = "m1.high"
}
