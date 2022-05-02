#output "server_1" {
#    value = data.intersight_compute_blade.server_1.results[0].name
#}

output "org_moid" {
    value = data.intersight_organization_organization.org.moid
}

output "template_moid" {
    value = intersight_server_profile_template.intersight_server_profile_template.moid
}