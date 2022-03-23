resource_group_name = "rg-aue-testapplication-dev"

rg_location = "Australia East"

tags = {
  BillingIdentifier = "123"
  ProjectIdentifier = "###"
  Owner             = "Team"
  CreatedBy         = "DevOps Team"
  DeployedBy        = "Terraform"
  Application       = "TBC"
  Environment       = "DEV"
}

##################################
# For Virtual network and creating Subnets
##################################

virtual_network_name = "vnet-aue-testapplication-dev-001"
subnet_names         = ["subnet-aue-testapplication-dev-001"]
address_space        = ["10.0.0.0/16"]
subnet_prefixes      = ["10.0.0.0/24"]
# Here one can link existing NSG's to the screated subnets
nsg_ids = {
  subnet-aue-testapplication-dev-001 = "/subscriptions/8ed10420-77c0-4102-b891-ca5bbeb43816/resourceGroups/rg-aue-testapplication-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-aue-testapplication-dev-001"
}
# Here one can add a service endpoint for each created subnet
subnet_service_endpoints = {
  subnet-aue-testapplication-dev-001 = ["Microsoft.Storage", "Microsoft.Sql", "Microsoft.KeyVault", "Microsoft.EventHub"]
}




##################################
# For Creating NSGs
##################################

#nsg_resource_group_name = "rg-int-aue-erp-dev"
security_group_name = "nsg-aue-testapplication-dev-001"

custom_rules = [
  {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Allow SSH"
  },


]


##############################################################
# Variables for key vault #
##############################################################

key_vault_name             = "kv-int-aue-erp-dev"
key_vault_sku_pricing_tier = "standard"
subnet_name                = "subnet-aue-testapplication-dev-001"


##############################################################
# Variables for public ip #
##############################################################

resource_names    = "pip-test"
allocation_method = "Static"


# Azure Storage account variables #

storage_account_name = "staauediaglog1257"

# Azure Storage account container variables #

containers_list = [
  { name = "devcontainer1", access_type = "private" }
]