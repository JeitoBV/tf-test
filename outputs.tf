output "vsphere_server" {
  value = var.vsphere_server
}

output "vsphere_datacenter" {
  value = data.vsphere_datacenter.datacenter.name
}

output "server_ip_address" {
  value = vsphere_virtual_machine.testserver.default_ip_address
}