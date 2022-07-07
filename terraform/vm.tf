# Creamos una máquina virtual
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVM" {
  name                            = var.vms[count.index]
  count                           = length(var.vms)
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = (var.vms[count.index] == "worker01" ? var.vm_size_workers : var.vms[count.index] == "master" ? var.vm_size_master : var.vm_size)
  admin_username                  = "ansible"
  network_interface_ids           = [azurerm_network_interface.myNic[count.index].id]
  disable_password_authentication = true

  admin_ssh_key {
    username   = "ansible"
    public_key = file("~/.ssh/id_rsa.pub")
  }
  
  

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
  }

  tags = {
    environment = "CP2"
  }

}
