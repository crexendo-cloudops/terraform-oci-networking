module "vcn" {
  source = "github.com/crexendo-cloudops/terraform-oci-networking//modules/vcn?ref=ignore_tags"

  # Oracle Cloud Infrastructure Tenancy and Compartment OCID
  compartment_ocid = var.compartment_ocid

  # Deployment Tags + Freeform Tags + Defined Tags
  vcn_tags = local.oci_tag_values

  # Virtual Cloud Network (VCN) arguments
  create_new_vcn          = true
  existent_vcn_ocid       = ""
  cidr_blocks             = ["10.12.0.0/16"]
  display_name            = "[${local.app_name}] VCN (${local.deploy_id})"
  dns_label               = "${local.app_name_for_dns}${local.deploy_id}"
  is_ipv6enabled          = false
  ipv6private_cidr_blocks = []
}