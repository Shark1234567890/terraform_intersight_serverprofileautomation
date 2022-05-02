############################
# FC Adapter Policy     #
############################

resource "intersight_vnic_fc_adapter_policy" "intersight_vnic_fc_adapter_policy1" {
  organization {
    object_type = "organization.Organization"
    moid        = data.intersight_organization_organization.org.results[0].moid
  }

  name = "${var.env}_vNic_fc_Adapter_Policy"
  description = "FC Adapter Policy by Terraform"

  error_recovery_settings {
      enabled = false
      # io_retry_count = 255
      # io_retry_timeout = 50
      # link_down_timeout = 240000
      # port_down_timeout = 240000
  }

  error_detection_timeout = 2000

  resource_allocation_timeout = 100000

  flogi_settings {
      retries = 8
      timeout = 4000
  }

  plogi_settings {
      retries = 8
      timeout = 20000
  }

  interrupt_settings {
      mode = "MSIx"
  }

  io_throttle_count = 256

  lun_count = 1024
  lun_queue_depth = 20

  rx_queue_settings {
      nr_count = 1
      ring_size = 64
  }

  tx_queue_settings {
      nr_count = 1
      ring_size = 64
  }

  scsi_queue_settings {
      nr_count = 1
      ring_size = 512
  }

}