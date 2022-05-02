###############################
# LAN Connectivity Policy     #
###############################

resource "intersight_vnic_lan_connectivity_policy" "intersight_vnic_lan_connectivity_policy1" {
  name             = "${var.env}_LAN_Connectivity_Policy"
  placement_mode = "custom"
  target_platform = "FIAttached"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

}