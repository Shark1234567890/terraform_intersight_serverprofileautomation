############################
# VLAN ESXi MGMT                #
############################

resource "intersight_fabric_eth_network_group_policy" "intersight_fabric_eth_network_group_policy1" {
  name             = "${var.env}_ESXi_MGMT_VLAN"
  description      = "${var.env} VLANs needed on MGMT interface ESXi"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
  # Excluding VLANs for eth0, eth1, and FCoE
  vlan_settings {
      object_type  = "vnic.VlanSettings"
      native_vlan = 1
      allowed_vlans = "11"
  }
}

############################
# VLAN ESXi vMotion        #
############################

resource "intersight_fabric_eth_network_group_policy" "intersight_fabric_eth_network_group_policy2" {
  name             = "${var.env}_ESXi_vMotion_VLAN"
  description      = "${var.env} VLANs needed on vMotion interface ESXi"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
  # Excluding VLANs for eth0, eth1, and FCoE
  vlan_settings {
      object_type  = "vnic.VlanSettings"
      native_vlan = 1
      allowed_vlans = "12"
  }
}

############################
# VLAN ESXi VMs            #
############################

resource "intersight_fabric_eth_network_group_policy" "intersight_fabric_eth_network_group_policy3" {
  name             = "${var.env}_ESXi_VM_VLAN"
  description      = "${var.env} VLANs needed for VMson  ESXi"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
  # Excluding VLANs for eth0, eth1, and FCoE
  vlan_settings {
      object_type  = "vnic.VlanSettings"
      native_vlan = 1
      allowed_vlans = "11,12,13,14"
  }
}