############################
# IQN Pool                 #
############################

resource "intersight_iqnpool_pool" "iqnpool_pool1" {
  name             = "${var.env}_IQN_Pool"
  description      = "IQN Pool"
  assignment_order = "sequential"
  prefix           = var.iqnprefix
  iqn_suffix_blocks {
    object_type = "iqn.SuffixBlocks"
    suffix      = var.iqnsuffix
    from        = "6757"
    size        = "100"
  }
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}