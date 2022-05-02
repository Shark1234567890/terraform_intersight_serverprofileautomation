data "intersight_organization_organization" "org" {
    name = var.organization
}

data "intersight_compute_physical_summary" "server_moid" {
  name  = var.server_list[count.index].name
  count = length(var.server_list)
}