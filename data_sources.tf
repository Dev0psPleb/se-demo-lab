  data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_dc_name}"
}

data "vsphere_resource_pool" "pool" {
  count         = "${var.vsphere_resource_pool != "" ? 1 : 0}"
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

#data "vsphere_datastore_cluster" "datastore_cluster" {
#  name          = "${var.vsphere_dscluster}"
#  datacenter_id = "${data.vsphere_datacenter.dc.id}"
#}

data "vsphere_compute_cluster" "cluster" {
    name            = "${var.vsphere_compute_cluster}"
    datacenter_id   = "${data.vsphere_datacenter.dc.id}"       
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_portgroup_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vsphere_template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
