# vmm-terraform

Tested on versions:
```shell
#> terraform version
Terraform v0.14.2
+ provider registry.terraform.io/dmacvicar/libvirt v0.6.2
+ provider registry.terraform.io/hashicorp/template v2.2.0
```

Current terraform plugin found at:
```shell
/root/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/terraform-provider-libvirt
```

Steps:
- Create ```images``` directory, and download cloud images.
- Make sure the path is properly set in ```/modules/singlevm/main.tf```, for cloud-image and cloud-config directories.
- Make sure to use proper image names (Just as the downloaded one) in ```terraform.tfvars```.
