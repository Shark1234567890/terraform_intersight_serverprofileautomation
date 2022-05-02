############################
# QoS Policy               #
############################

resource "intersight_vnic_eth_qos_policy" "intersight_vnic_eth_qos_policy1" {
  name           = "${var.env}_Eth_QoS_Policy"
  mtu            = 1500
  rate_limit     = 0
  cos            = 0
  burst          = 10240
  priority       = "Best Effort"
  trust_host_cos = false
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}