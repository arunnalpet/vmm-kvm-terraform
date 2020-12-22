# This type is deprecated. Declare the new way.
#variable "myvms" {
#  type = "list"
#  default = [ ]
#}

variable "myvms" {
  type = map(object({
    hostname  = string
    osdisk_gb = number
    CPU_Count = number
    RAM       = number
    Image     = string
  }))
  description = ""
}
