############################
# NTP Policy               #
############################

resource "intersight_ntp_policy" "intersight_ntp_policy1" {
  name    = "${var.env}_NTP_Policy"
  description = "NTP Policy"
  enabled = true
  ntp_servers = [
    "ntp1eu.asml.com",
    "ntp2eu.asml.com",
    "ntp3eu.asml.com",
    "ntp4eu.asml.com"
  ]
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }
}