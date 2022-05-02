#####################
# vMedia Policy     #
#####################

resource "intersight_vmedia_policy" "vmedia1" {
  name          = "${var.env}_vMedia_ESXi67U3_Policy"
  description   = "Automated installation of ESXi 6.0U7 by Terraform"
  enabled       = true
  encryption    = true
  low_power_usb = true
  mappings {
    device_type = "cdd"
    file_location = var.vmedia_file_location
    mount_protocol = var.vmedia_mount_protocol
    volume_name = "ESXi-via-HTTP"
  }

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

}