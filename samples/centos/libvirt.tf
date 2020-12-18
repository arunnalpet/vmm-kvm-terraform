# 20GB disk file
variable "diskBytes" { default = 1024*1024*1024*20 }

provider "libvirt" {
  uri = "qemu:///system"
}

# Remote provider example
#provider "libvirt" {
#  alias = "server2"
#  uri   = "qemu+ssh://root@192.168.100.10/system"
#}

# base OS volume from image
resource "libvirt_volume" "base-centos7-qcow2" {
  name = "CentOS-7-x86_64-GenericCloud.qcow2"
  pool = "images"
  source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

# OS volume
resource "libvirt_volume" "centos7-qcow2" {
  name = "centos7.qcow2"
  pool = "images"
  format = "qcow2"
  size = var.diskBytes 
  base_volume_id = libvirt_volume.base-centos7-qcow2.id
}

# Configure cloud-init
data "template_file" "user_data" {
 template = file("/root/terraform_proj/centos/cloud_init.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
   name           = "commoninit.iso"
   user_data      = data.template_file.user_data.rendered
  pool           = "images"
  }

#  network_config = data.template_file.network_config.rendered
#  pool           = libvirt_pool.ubuntu.name

# Define KVM domain to create
resource "libvirt_domain" "db1" {
  name   = "db1"
  memory = "1024"
  vcpu   = 1

  network_interface {
    network_name = "default"
  }

 cloudinit = libvirt_cloudinit_disk.commoninit.id

  disk {
    volume_id = "${libvirt_volume.centos7-qcow2.id}"
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
  value = libvirt_domain.db1.*.network_interface.0.addresses
}
