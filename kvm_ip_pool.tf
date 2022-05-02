############################
# KVM IP Pool              #
############################

resource "intersight_ippool_pool" "intersight_ip_pool1" {
  name             = "${var.env}_KVM_IP_Pool"
  description      = "IP Pool for server KVM console"
  assignment_order = "sequential"
  ip_v4_config {
    gateway     = var.kvmdipgw
    netmask     = var.kvmdipmask
    primary_dns = var.primarydns
    #secondary_dns = var.secondarydns
  }
  ip_v4_blocks {
    from        = var.kvmdipfrom
    to          = var.kvmdipto
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}