###############################
# SAN Connectivity Policy     #
###############################

resource "intersight_vnic_san_connectivity_policy" "intersight_vnic_san_connectivity_policy1" {
  name             = "${var.env}_SAN_Connectivity_Policy"
  placement_mode = "custom"
  target_platform = "FIAttached"

  wwnn_address_type = "POOL"
  wwnn_pool {
    moid = intersight_fcpool_pool.fcpool_WWNN_pool1.moid
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

}