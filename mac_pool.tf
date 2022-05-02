############################
# MAC A Pool               #
############################

resource "intersight_macpool_pool" "intersight_macpool_poolA" {
  name = "${var.env}_Mac_Pool_Internal_A"
  description = "Internal MAC Pool for FI A"
  mac_blocks {
    object_type = "macpool.Block"
    from        = var.macafrom
    to          = var.macato
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}

############################
# MAC B Pool               #
############################

resource "intersight_macpool_pool" "intersight_macpool_poolB" {
  name = "${var.env}_Mac_Pool_Internal_B"
  description = "Internal MAC Pool for FI B"
  mac_blocks {
    object_type = "macpool.Block"
    from        = var.macbfrom
    to          = var.macbto
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}