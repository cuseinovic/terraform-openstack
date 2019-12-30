# Router creation
resource "openstack_networking_router_v2" "generic" {
  name                = "router-generic"
  external_network_id = ${var.external_gateway}
}

# Network creation
resource "openstack_networking_network_v2" "generic" {
  name = "network-generic"
}

#### HTTP SUBNET ####

# Subnet http configuration
resource "openstack_networking_subnet_v2" "subnet" {
  name            = var.network_cidr["subnet_name"]
  network_id      = openstack_networking_network_v2.generic.id
  cidr            = ${var.network_cidr["cidr"]}
  dns_nameservers = ${var.dns_ip}
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "demo" {
  router_id = openstack_networking_router_v2.generic.id
  subnet_id = openstack_networking_subnet_v2.sub-demo.id
}
