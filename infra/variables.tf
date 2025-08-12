variable "tenancy_ocid" {
  type = string
}

variable "user_ocid" {
  type = string
}
variable "fingerprint" {
  type = string
}
variable "private_key" {
  type = string
}
variable "region" {
  type = string
}

variable "vcn_cidr_blocks" {
  default = [
    "10.0.0.0/16"
  ]
}

variable "subnet_cidr_block" {
  default = "10.0.0.0/24"
}

variable "instance_shape_memory" {
  default = "2"
}

variable "instance_shape_vcpus" {
  default = "1"
}

variable "instance_boot_volume_size_in_gbs" {
  default = "50"
}

variable "instance_shape_micro" {
  default = "VM.Standard.E2.1.Micro"
}

variable "instance_shape_standard" {
  default = "VM.Standard.A1.Flex"
}

variable "compartment_id" {
  type = string
}