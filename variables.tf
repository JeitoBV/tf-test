variable "vsphere_user" {
  description = "Vsphere username"
  type        = string
}

variable "vsphere_password" {
  description = "Vsphere Password"
  type        = string
  sensitive   = true
}

variable "vsphere_server" {
  description = "Vsphere Server"
  type        = string
}