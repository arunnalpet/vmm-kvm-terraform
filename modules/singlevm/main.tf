# Use the following variables
# vmname = "testvm"
# disksize = 40
# osimage = CentOS

# 20GB disk file
# variable "diskBytes" { default = 1024*1024*1024*20 }

# This will be declared in the root module
# provider "libvirt" {
#  uri = "qemu:///system"
#}

# parameterize OS centOS/ubuntu

# base OS volume from image
resource "libvirt_volume" "base-os-qcow2" {
  name   = "${var.vmname}-os-img.qcow2"
  pool   = "default"
  source = "/root/vmm-kvm-terraform/images/${var.osimage}"
  format = "qcow2"
}

# OS volume
resource "libvirt_volume" "os-vol" {
  name           = "${var.vmname}-os-vol.qcow2"
  pool           = "default"
  format         = "qcow2"
  size           = var.disksize * 1024 * 1024 * 1024
  base_volume_id = libvirt_volume.base-os-qcow2.id
}

# Configure cloud-init
data "template_file" "user_data" {
  template = file("/root/vmm-kvm-terraform/conf/cloud_init.cfg")
  vars = {
    hname = var.vmname
  }
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name      = "${var.vmname}-commoninit.iso"
  user_data = data.template_file.user_data.rendered
  pool      = "default"
}

# Create Domain
resource "libvirt_domain" "myvm" {
  name   = var.vmname
  memory = var.memory
  vcpu   = var.vcpu 

  network_interface {
    network_name = "default"
  }

 cloudinit = libvirt_cloudinit_disk.commoninit.id

  disk {
    volume_id = "${libvirt_volume.os-vol.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

output "ips" {
  # show IP, run 'terraform refresh' if not populated

  # WORKING ONE
  # value = libvirt_domain.myvm.*.network_interface.0.addresses
  
  value = libvirt_domain.myvm.network_interface.0.addresses
}

