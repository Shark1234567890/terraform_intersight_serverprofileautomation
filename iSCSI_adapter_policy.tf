############################
# iSCSI Adapter Policy     #
############################

resource "intersight_vnic_iscsi_adapter_policy" "vnic_iscsi_adapter_policy1" {
  name                = "${var.env}_vNic_iSCSI_Adapter_Policy"
  description         = "iSCSI Adapter Policy by Terraform"
  dhcp_timeout        = 60
  connection_time_out = 0
  lun_busy_retry_count = 0
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}