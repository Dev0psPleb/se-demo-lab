# Author: Jon Howe
# Blog: https://www.virtjunkie.com/vmware-provisioning-using-hashicorp-terraform-part-2/
# GitHub: https://github.com/jonhowe/Terraform-vSphere-VirtualMachine/blob/master/variables.tf

#===========================#
# VMware vCenter connection #
#===========================#

variable "vsphere_server" {
  description = "vsphere server for the environment - EXAMPLE: vcenter01.hosted.local"
}
variable "vsphere_user" {
  description = "vsphere server for the environment - EXAMPLE: vsphereuser"
}
variable "vsphere_password" {
  description = "vsphere server password for the environment"
}
variable "vsphere_dc_name" { 
    description = "Datacenter name in vCenter"
}
#variable "vsphere_dscluster" { 
#    description = "Datastore Cluster name in vCenter"
#}
variable "vsphere_datastore" {
    description = "vSphere Datastore"
}
variable "vsphere_compute_cluster" {  
    description = "Cluster name in vCenter"
}
variable "vsphere_resource_pool" {
    description = "The resource pool to deploy the virtual machines to. If specifying a the root resource pool of a cluster, enter CLUSTER_NAME/Resources."
}
variable "vsphere_portgroup_name" { 
    description = "Port Group new VM(s) will use"
}
variable "vsphere_folder" {
    type = string
    description = "Demo Lab VM folder"
}
variable "vsphere_template_name" {
    type = string
    description = "VM Template"
}
variable "vsphere_unverified_ssl" {
    type = string
    description = "Is the VMware vCenter using a self signed certificate (true/false)"
    default = "false"
}
variable "vsphere_api_timeout" {
    type = string
    description = "vSphere API Timeout value. Default is 30 minutes."
    default = 30
}

# VM Configuration Params

variable "vm_name" { 
    description = "New VM Name"
}
variable "vm_ip" { 
    description = "IP Address to assign to VM"
}
variable "vm_cidr" { 
    description = "CIDR Block for VM"
}
variable "vcpu_count" { 
    description = "How many vCPUs do you want?"
}
variable "memory" { 
    description = "RAM in MB"
}
variable "is_windows_image" {
  description = "Boolean flag to notify when the custom image is windows based."
  default     = false
}
variable "vm_firmware" {
    description = "Firmware for cloned virtual machines"
    default = "efi"
}

# Miscelaneous VM Variables

variable "vm_count" {
    type = string
    description = "Number of VM's"
    default = 1
}
variable "vm_domain" {
    type = string 
    description = "Virtual machine domain name. This set's the FQDN of the host,"
    default = "demolab.local"
}
variable "vm_linked_clone" {
    type = string
    description = "Use linked clone to create the vSphere virtual machine from the template (true/false). If you would like to use the linked clone feature, your template need to have one and only one snapshot"
    default = "false"
}
variable "wait_for_guest_net_timeout" {
    description = "The timeout, in mintues, to wait for the guest network when creating virtual machines. On virtual machines created from scratch, you may wish to adjust this value to -1, which will disable the waiter."
    default = "-1"
}

# Windows Administrator Password

variable "winadmin_password" {
    type = string
    description = "Windows Administrator Password for WinRM connectivity"
    default = "packer"
}

# Common Network Parameters

variable "domain_name" { 
    description = "Domain Search name"
}
variable "default_gw" {
    type = string
    description = "Demo Lab Default Gateway"
}
variable "dns_server" {
    type = string
    description = "Demo Lab DNS Servers"
}