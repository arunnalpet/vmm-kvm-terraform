# vmm-terraform

#### Downloads:
Tool | Link 
--- | ---
Terraform | [v0.14.2](https://releases.hashicorp.com/terraform/0.14.2/terraform_0.14.2_linux_amd64.zip)
libvirt | [v0.6.2 on Ubuntu 18.04](https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.2/terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Ubuntu_18.04.amd64.tar.gz)
libvirt | [v0.6.2 on Centos 7.6.1810](https://github.com/dmacvicar/terraform-provider-libvirt/releases/download/v0.6.2/terraform-provider-libvirt-0.6.2+git.1585292411.8cbe9ad0.Fedora_28.x86_64.tar.gz)

#### Tested on versions:
```shell
#> terraform version
Terraform v0.14.2
+ provider registry.terraform.io/dmacvicar/libvirt v0.6.2
+ provider registry.terraform.io/hashicorp/template v2.2.0
```

#### Current terraform plugin found at:
```shell
/root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/terraform-provider-libvirt
```

#### Troubleshoot plugin discovery or terraform issues
```shell
export TF_LOG=debug
```

#### Steps:
- Make sure the path is properly set in  ```/modules/singlevm/main.tf```, for cloud-image and cloud-config directories.
- Make sure to use proper image names (Just as the downloaded one) in ```terraform.tfvars```.
- Make sure you have provided proper bridge interface in ```/modules/singlevm/main.tf```

## VMM Managers

[Cockpit UI for managing VMs on KVMs (on multiple hosts as well)](https://www.tecmint.com/manage-kvm-virtual-machines-using-cockpit-web-console/amp/#csi=0&referrer=https%3A%2F%2Fwww.google.com&amp_tf=From%20%251%24s)

[Cockpit Configuration](https://cockpit-project.org/guide/133/listen.html)

[Mist](https://mist.io/)

[Foreman](https://theforeman.org/)

[Kimchi](https://github.com/kimchi-project/kimchi)

[oVirt by RedHat](https://www.ovirt.org/)

[List of KVM Managers](https://www.linux-kvm.org/page/Management_Tools)
