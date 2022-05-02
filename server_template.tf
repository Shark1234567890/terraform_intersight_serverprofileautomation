###############################
# Server Template             #
###############################

resource "intersight_server_profile_template" "intersight_server_profile_template" {
  name             = "${var.env}_Server_Template"
  description      = "Server Template from TF"
  target_platform  = "FIAttached"

  action = "Deploy"

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

  uuid_pool {
    moid = intersight_uuidpool_pool.uuidpool_pool1.moid
    object_type = "uuidpool.Pool"
  }

  # BIOS
  policy_bucket {
     moid = intersight_bios_policy.bios_policy1.moid
     object_type = "bios.Policy"
  }

  # Boot Order
  policy_bucket {
    moid = intersight_boot_precision_policy.boot_precision1.moid
    object_type = "boot.PrecisionPolicy"
  }

  # Virtual Media
  policy_bucket {
    moid = intersight_vmedia_policy.vmedia1.moid
    object_type = "vmedia.Policy"
  }

  # LAN Connectivity Policy
  policy_bucket {
    moid = intersight_vnic_lan_connectivity_policy.intersight_vnic_lan_connectivity_policy1.moid
    object_type = "vnic.LanConnectivityPolicy"
  }

  # SAN Connectivity Policy
  policy_bucket {
    moid = intersight_vnic_san_connectivity_policy.intersight_vnic_san_connectivity_policy1.moid
    object_type = "vnic.SanConnectivityPolicy"
  }

}


###############################
# Server Profile              #
###############################

#resource "intersight_server_profile" "profile" {
#  name   = "${var.env}_serverprofile_${var.server_list[count.index].name}"
#  description = "Profile for server ${var.server_list[count.index].name} derived from template"

#   target_platform = "FIAttached"
#   #action = "Unassign"

#  src_template {
#    moid = intersight_server_profile_template.intersight_server_profile_template.moid
#    object_type = "server.ProfileTemplate"
#  }

  #assigned_server {
  #  object_type = var.server_list[count.index].object_type
  #  moid = data.intersight_compute_physical_summary.server_moid[count.index].id
  #}

#  organization {
#    object_type = "organization.Organization"
#    moid        = data.intersight_organization_organization.org.results[0].moid
#  }

#  count = length(var.server_list)
#}


###############################
# Server Profile Bulk         #
###############################

resource "null_resource" "server_profile" {
  provisioner "local-exec" {
    command = "python main.py ${intersight_server_profile_template.intersight_server_profile_template.moid} ${length(var.server_list)} ${var.api_key} ${var.secretkey}"
  }
}