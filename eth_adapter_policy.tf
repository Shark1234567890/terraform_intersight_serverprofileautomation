############################
# Eth Adapter Policy     #
############################

resource "intersight_vnic_eth_adapter_policy" "intersight_vnic_eth_adapter_policy1" {

  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

  name = "${var.env}_vNic_Eth_Adapter_Policy"
  description = "Eth Adapter Policy by Terraform"

  interrupt_scaling = false
  advanced_filter = false

  vxlan_settings {
    enabled = false
  }

  roce_settings {
    enabled = false
  }

  nvgre_settings {
      enabled = false
  }

  arfs_settings {
    enabled = false
  }

    # Defaults
  uplink_failback_timeout = 5

  completion_queue_settings {
     nr_count = 5
     ring_size = 1
  }

  interrupt_settings {
    nr_count = 8
    coalescing_time = 125
    coalescing_type = "MIN"
    mode = "MSIx"
  }

  rss_settings = true

  rss_hash_settings {
    ipv4_hash = true
    ipv6_ext_hash = false
    ipv6_hash = true
    tcp_ipv4_hash = true
    tcp_ipv6_ext_hash = false
    tcp_ipv6_hash = true
    udp_ipv4_hash = false
    udp_ipv6_hash = false
  }

  rx_queue_settings {
    nr_count = 4
    ring_size = 512
  }

  tx_queue_settings{
    nr_count = 1
    ring_size = 256
  }

  tcp_offload_settings {
    large_receive = true
    large_send = true
    rx_checksum = true
    tx_checksum = true
  }
}