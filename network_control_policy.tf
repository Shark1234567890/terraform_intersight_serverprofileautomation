############################
# Network Control Policy   #
############################

resource "intersight_fabric_eth_network_control_policy" "fabric_eth_network_control_policy1" {
  name        = "${var.env}_Network_Control_Policy"
  description = "ESXi Network Control Policy"
  cdp_enabled = true
  forge_mac    = "allow"
  lldp_settings {
    object_type       = "fabric.LldpSettings"
    receive_enabled  = false
    transmit_enabled = true
  }
  mac_registration_mode = "allVlans"
  uplink_fail_action    = "linkDown"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}