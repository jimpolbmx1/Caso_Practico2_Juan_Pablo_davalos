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

variable "subscription_id" {
  type        = string
  description = "subscription_id"
  default     = "3038df55-5424-492e-b9b5-eafbdac21ff7"
}

variable "client_id" {
  type        = string
  description = "client_id"
  default     = "21280ce6-5127-4813-a9d9-581db0f2abf3"
}

variable "client_secret" {
  type        = string
  description = "client_secret"
  default     = "9zU8Q~UnzAfT2MKrgRho0NEcNHfYALOO1x7pMdgD"
}

variable "tenant_id" {
  type        = string
  description = "tenant_id"
  default     = "899789dc-202f-44b4-8472-a6d40f9eb440"
}

