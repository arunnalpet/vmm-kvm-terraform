provider "libvirt" {
  uri = "qemu:///system"
}


# For each VM declared in terraform.tfvars, deploy a VM
module "kvm_instances" {
  source = "./modules/singlevm"

  for_each = var.myvms

  vmname   = each.value.hostname
  disksize = each.value.osdisk_gb
  ephdisksize = each.value.ephdisk_gb
  persdisksize = each.value.persdisk_gb
  osimage  = each.value.Image
  memory   = each.value.RAM
  vcpu     = each.value.CPU_Count


}

output "all_ips" {
   value = { for vm in keys(var.myvms) : vm => module.kvm_instances[vm].ips }
}
