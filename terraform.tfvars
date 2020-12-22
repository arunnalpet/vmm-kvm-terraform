# myvms = [
#    {
#         hostname = "centos01"
#         osdisk_gb = 20
#         CPU_Count = 4
#         RAM = 256
#         Image = "CentOS-7-x86_64-GenericCloud.qcow2"
#     } ,
#     {
#         hostname = "ubuntu01"
#         osdisk_gb = 40
#         CPU_Count = 8
#         RAM = 512
#         Image = "ubuntu-16.04-server-cloudimg-amd64-disk1.img"
#     }
# ]

myvms = {
  vm1 = {
    hostname  = "centos01"
    osdisk_gb = 20
    CPU_Count = 4
    RAM       = 256
    Image     = "CentOS-7-x86_64-GenericCloud.qcow2"
  }
  vm2 = {
    hostname  = "ubuntu01"
    osdisk_gb = 40
    CPU_Count = 8
    RAM       = 512
    Image     = "ubuntu-16.04-server-cloudimg-amd64-disk1.img"

  }
}
