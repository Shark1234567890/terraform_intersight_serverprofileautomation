############################
# UUID Pool                #
############################

resource "intersight_uuidpool_pool" "uuidpool_pool1" {
  name             = "${var.env}_UUID_Pool"
  description      = "UUID Pool for all devices"
  assignment_order = "default"
  prefix           = "123e4567-e89b-42d3"
  uuid_suffix_blocks {
    object_type = "uuidpool.UuidBlock"
    from        = var.uuidfrom
    #to         = var.uuidto
    size        = 128
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}