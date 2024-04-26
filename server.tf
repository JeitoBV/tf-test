locals {
  server_name = "NLTEST-FRANK1"
}

resource "vsphere_virtual_machine" "testserver" {
  name                    = local.server_name
  resource_pool_id        = data.vsphere_host.host.resource_pool_id
  datastore_id            = data.vsphere_datastore.datastore.id
  host_system_id          = data.vsphere_host.host.id
  folder                  = "TF_Workshop"
  num_cpus                = 2
  memory                  = 1024 * 4 # 4Gb
  guest_id                = "rhel9_64Guest"
  scsi_type               = "pvscsi"
  firmware                = "efi"
  efi_secure_boot_enabled = true

  network_interface {
    network_id   = data.vsphere_network.demo.id
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    unit_number      = 0
    size             = 40 # 40 Gb
    thin_provisioned = false
  }

  clone {
    template_uuid = data.vsphere_content_library_item.rhel9.id
    customize {
      linux_options {
        host_name = local.server_name
        domain    = "huijbregts.com"
      }
      network_interface {}
      dns_server_list = ["8.8.8.8"]
      dns_suffix_list = ["huijbregts.com"]
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = var.vm_user
      password    = var.vm_password
      host        = self.default_ip_address
      script_path = "./terraform_%RAND%.sh"
    }
    inline = [
      "hostname",
      "sudo yum update"
    ]
  }
}