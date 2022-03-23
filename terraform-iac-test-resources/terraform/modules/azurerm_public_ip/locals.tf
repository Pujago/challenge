locals {
  resource_names = lower(var.resource_names)
  mandatory_tags = {
    DeployedBy = "Terraform"
  }
}