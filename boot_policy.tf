#####################
# Boot Policy       #
#####################

resource "intersight_boot_precision_policy" "boot_precision1" {
  name                     = "${var.env}_Boot_Policy"
  description              = "ISCSI Boot policy for ESXi hypervisors by Terraform"
  configured_boot_mode     = "Legacy"
  enforce_uefi_secure_boot = true
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
  boot_devices {
    enabled     = true
    name        = "A"
    object_type = "boot.Iscsi"
    additional_properties = jsonencode({
      interface_name = "ESXi_ISCSI_A"
    })
  }
  boot_devices {
    enabled     = true
    name        = "B"
    object_type = "boot.Iscsi"
    additional_properties = jsonencode({
      interface_name = "ESXi_ISCSI_B"
      port = 3260
    })
  }
  boot_devices {
    enabled     = true
    name        = "KVM-DVD"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "kvm-mapped-dvd"
    })
  }
}