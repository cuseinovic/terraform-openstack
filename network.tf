# Router creation
resource "openstack_networking_router_v2" "generic" {
  name                = "router"
  external_network_id = "${var.external_network_id}"
}

# Network creation
resource "openstack_networking_network_v2" "generic" {
  name = "network-private"
}

#### HTTP SUBNET ####

# Subnet http configuration
resource "openstack_networking_subnet_v2" "subnet" {
  name            = var.network_cidr["subnet_name"]
  network_id      = openstack_networking_network_v2.generic.id
  cidr            = "${var.network_cidr["cidr"]}"
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "demo" {
  router_id = openstack_networking_router_v2.generic.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
