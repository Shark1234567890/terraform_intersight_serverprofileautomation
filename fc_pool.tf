############################
# WWNN Pool                #
############################
resource "intersight_fcpool_pool" "fcpool_WWNN_pool1" {
  name             = "${var.env}_WWNN_Pool"
  description      = "Terraform deployed"
  assignment_order = "sequential"
  id_blocks {
    object_type = "fcpool.Block"
    from        = var.wwnnfrom
    to        = var.wwnnto
  }
  pool_purpose = "WWNN"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}

############################
# WWPN Pool                  #
############################
resource "intersight_fcpool_pool" "fcpool_WWPN_pool1" {
  name             = "${var.env}_WWPN_Pool"
  description      = "Terraform deployed"
  assignment_order = "sequential"
  id_blocks {
    object_type = "fcpool.Block"
    from        = var.wwpnfrom
    to        = var.wwpnto
  }
  pool_purpose = "WWPN"
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}