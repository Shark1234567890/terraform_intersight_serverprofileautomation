variable "api_key" {
  type = string
  description = "API Key Id from Intersight"
}
variable "secretkey" {
  type = string
  description = "The path to your secretkey for Intersight OR the your secret key as a string"
}
variable "organization" {
  type = string
  description = "Organization Name"
  default = "default"
}
variable "server_list" {
  type        = list(map(string))
  description = "Servers (identified by name, object_type, and target_platform) to assign to configured server profiles"
}
variable "password" {
    type = string
    description = "Default Password"
}
variable "env" {
    type = string
    description = "Environment"
}
variable "kvmdipgw" {
    type = string
    description = "KVM IP GW"
}
variable "kvmdipmask" {
    type = string
    description = "KVM IP Netmask"
}
variable "kvmdipfrom" {
    type = string
    description = "KVM IP From"
}
variable "kvmdipto" {
    type = string
    description = "KVM IP To"
}
variable "macafrom" {
    type = string
    description = "Mac Pool A from"
}
variable "macato" {
    type = string
    description = "Mac Pool A to"
}
variable "macbfrom" {
    type = string
    description = "Mac Pool B from"
}
variable "macbto" {
    type = string
    description = "Mac Pool B to"
}
variable "iqnprefix" {
    type = string
    description = "IQN Prefix"
}
variable "iqnsuffix" {
    type = string
    description = "IQN Sufix"
}
variable "uuidfrom" {
    type = string
    description = "UUID From Pool"
}
variable "uuidto" {
    type = string
    description = "UUID To Pool"
}
variable "primarydns" {
    type = string
    description = "Primary DNS"
}
variable "secondarydns" {
    type = string
    description = "Secondary DNS"
}
variable "wwnnto" {
    type = string
    description = "WWNN Pool"
}
variable "wwnnfrom" {
    type = string
    description = "WWNN Pool"
}
variable "wwpnto" {
    type = string
    description = "WWPN Pool"
}
variable "wwpnfrom" {
    type = string
    description = "WWPN Pool"
}
variable "vmedia_file_location" {
  type = string
  description = "Remote location of vmedia image"
}
variable "vmedia_mount_protocol" {
  type = string
  description = " Protocol to use to communicate with the remote server for the vmedia, can be nfs, cifs, http, or https."
}