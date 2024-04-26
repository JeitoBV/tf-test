output "vsphere_server" {
  value = var.vsphere_server
}

output "vsphere_datacenter" {
  value = data.vsphere_datacenter.datacenter.name
}
