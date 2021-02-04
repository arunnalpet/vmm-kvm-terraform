# vmname = "testvm"
# disksize = 40

variable "disksize" {
  type = number
}

variable "ephdisksize" {
  type = number
}

variable "persdisksize" {
  type = number
}

variable "vmname" {
  type = string
}

variable "osimage" {
  type = string
}

variable "memory" {
  type = number
}

variable "vcpu" {
  type = number
}
