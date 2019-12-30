resource "openstack_compute_instance_v2" "moninstance" {
  name        = "moninstance"
  image_name  = ${var.image}
  flavor_name = ${var.flavor}
  key_pair    = ${openstack_compute_keypair_v2.user_key.name}
  user_data   = ${file("scripts/webserver.sh")}
  network {
    port = openstack_networking_port_v2.sub-demo.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "moninstance" {
  name           = "moninstance-port"
  network_id     = openstack_networking_network_v2.generic.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.http.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.http.id
  }
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "fip_moninstance" {
  pool = ${var.external_network}
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "moninstance" {
  floating_ip = openstack_networking_floatingip_v2.fip_moninstance.address
  instance_id = openstack_compute_instance_v2.moninstance.id
}
