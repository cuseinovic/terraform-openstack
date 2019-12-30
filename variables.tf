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
variable "external_network" {
  type    = string
  default = "public"
}

variable "public-subnet" {
  type    = string
  default = "32966d84-fdac-4fec-9f28-b714e2427aba"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

variable "network_cidr" {
  type    = map(string)
  default = {
    subnet_name = "subnet-demo"
    cidr        = "192.168.100.0/24"
  }
}

# Flavor instance
variable "flavor_http" {
  type    = string
  default = "m1.medium"
}
