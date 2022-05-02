############################
# vHBA                     #
############################

resource "intersight_vnic_fc_if" "mlom_fc0_A" {
    name = "mlom_fc0_A"
    order = 0

    wwpn_address_type = "POOL"
    wwpn_pool {
      moid = intersight_fcpool_pool.fcpool_WWPN_pool1.moid
    }

    placement {
        id = "MLOM"
        switch_id = "A"
        pci_link = 0
        uplink = 0
    }

    type = "fc-initiator"
    persistent_bindings = true

    san_connectivity_policy {
        moid = intersight_vnic_san_connectivity_policy.intersight_vnic_san_connectivity_policy1.moid
    }

    fc_network_policy {
        moid = intersight_vnic_fc_network_policy.intersight_vnic_fc_network_policy1.moid
    }

    fc_adapter_policy {
        moid = intersight_vnic_fc_adapter_policy.intersight_vnic_fc_adapter_policy1.moid
    }

}