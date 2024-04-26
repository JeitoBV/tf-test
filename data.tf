data "vsphere_datacenter" "datacenter" {
  name = "DC-Huijbregts"
}

data "vsphere_datastore" "datastore" {
  name          = "VMFS11-NoSnapShot"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = "esx-vb-03.huijbregts.com"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "demo" {
  name          = "DEMO"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_content_library" "library" {
  name = "HGDevops"
}

data "vsphere_content_library_item" "rhel9" {
  name       = "linux-rhel-9.2-v23.11"
  type       = "vm-template"
  library_id = data.vsphere_content_library.library.id
}
