variable "image" {
  type    = string
  default = "Centos 7"
}

variable "external_network" {
  type    = string
  default = "public"
}

# UUID of external gateway
variable "subnet-public" {
  type    = string
  default = "f67f0d72-0ddf-11e4-9d95-e1f29f417e2f"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

variable "flavor_http" {
  type    = string
  default = "t2.medium"
}

variable "network_cidr" {
  type    = map(string)
  default = {
    subnet_name = "subnet-demo"
    cidr        = "192.168.100.0/24"
  }
}
