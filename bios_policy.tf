#####################
# Bios Policy       #
#####################

resource "intersight_bios_policy" "bios_policy1" {
  name                                  = "${var.env}_ESXi_BIOS_Policy"
  description                           = "Performance Settings for ESXi by Terraform"
  cpu_performance                       = "enterprise"
  dram_clock_throttling                 = "Performance"
  direct_cache_access                   = "enabled"
  enhanced_intel_speed_step_tech        = "enabled"
  execute_disable_bit                   = "enabled"
  cpu_frequency_floor                   = "enabled"
  intel_hyper_threading_tech            = "enabled"
  intel_turbo_boost_tech                = "enabled"
  intel_virtualization_technology       = "enabled"
  processor_cstate                      = "disabled"
  processor_c1e                         = "disabled"
  processor_c3report                    = "disabled"
  processor_c6report                    = "disabled"
  cpu_power_management                  = "performance"
  cpu_energy_performance                = "performance"
  intel_vt_for_directed_io              = "enabled"
  numa_optimized                        = "enabled"

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

}