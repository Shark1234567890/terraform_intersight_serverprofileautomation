############################
# VLAN FC                  #
############################
resource "intersight_vnic_fc_network_policy" "intersight_vnic_fc_network_policy1" {
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

  description = "Terraform deployed"
  name = "${var.env}_vnic_fc_network_Policy"

  vsan_settings {
      id = 100
  }
}
