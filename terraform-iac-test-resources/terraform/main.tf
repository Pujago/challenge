

module "resource_group" {
  source   = "./modules/azurerm_resource_group"
  name     = var.resource_group_name
  location = var.rg_location
  tags     = var.tags
}

module "nsg" {
  source              = "./modules/azurerm_network_security_group"
  resource_group_name = module.resource_group.name
  security_group_name = var.security_group_name
  custom_rules        = var.custom_rules
  tags                = var.tags
  depends_on          = [module.resource_group.name]
}

module "virtual-network" {
  source = "./modules/azurerm_virtual_network"

  vnet_name           = var.virtual_network_name
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  depends_on          = [module.resource_group.name]

}


module "subnet" {
  source                   = "./modules/azurerm_subnet"
  subnet_names             = var.subnet_names
  resource_group_name      = var.resource_group_name
  virtual_network_name     = var.virtual_network_name
  subnet_prefixes          = var.subnet_prefixes
  nsg_ids                  = var.nsg_ids
  subnet_service_endpoints = var.subnet_service_endpoints
  depends_on               = [module.virtual-network, module.nsg]
}


module "key-vault" {
  source = "./modules/azurerm_key_vault"

  # Resource Group and Key Vault pricing tier details
  resource_group_name        = var.resource_group_name
  key_vault_name             = var.key_vault_name
  key_vault_sku_pricing_tier = var.key_vault_sku_pricing_tier

  network_acls = {
    bypass                     = "AzureServices"
    ip_rules                   = []
    default_action             = "Deny"
    virtual_network_subnet_ids = [ module.subnet.id[0] ]
  }

  tags       = var.tags
  depends_on = [module.resource_group.name]
}


# module "public_ip" {
#   source              = "./modules/azurerm_public_ip"
#   resource_names      = var.resource_names
#   resource_group_name = var.resource_group_name
#   allocation_method   = var.allocation_method
#   depends_on          = [module.resource_group.name]
# }



module "storage" {

  source = "./modules/azurerm_storage_account"

  resource_group_name  = var.resource_group_name
  storage_account_name = var.storage_account_name

  network_rules = {
    bypass     = ["AzureServices"]
    ip_rules   = []
    subnet_ids = []
  }

  tags       = var.tags
  depends_on = [module.resource_group.name]

}


# Create network interface
resource "azurerm_network_interface" "main" {
  name                = "nicforvm"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  ip_configuration {
    name                          = "nicConfiguration"
    subnet_id                     = module.subnet.id[0]
    private_ip_address_allocation = "Dynamic"
    #public_ip_address_id          = module.public_ip.id
  }
  
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = module.nsg.network_security_group_id
  #depends_on                = [module.nsg.id]
}

# Create (and display) an SSH key
resource "tls_private_key" "example_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "main" {
  name                  = "vmaueapplication1001"
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.name
  network_interface_ids = [azurerm_network_interface.main.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "vmaueapplication1001"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = module.storage.primary_blob_endpoint
  }
}