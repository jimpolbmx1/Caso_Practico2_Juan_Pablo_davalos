variable "location" {
  type        = string
  description = "Región de Azure donde crearemos la infraestructura"
  default     = "UK South"
}

variable "vm_size" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_B1s" # 1 GB, 1 CPU 
}

variable "vm_size_master" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_D2s_v3" # 4 GB, 2 CPU 
}

variable "vm_size_workers" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_B2s" # 4 GB, 2 CPU
}

variable "vms" {
  type        = list(string)
  description = "Maquinas virtuales a crear"
  default     = ["master", "worker01", "nfs"]
}
