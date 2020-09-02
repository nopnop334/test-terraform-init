 resource "proxmox_vm_qemu" "ubuntu_1" {
   name              = "HAproxy-2"
   target_node       = "pve-sms-dr"
   vmid              = 100199
   clone             = "30"
   full_clone        = true
   memory            = 8192
   cores             = 8
   sockets           = 2

   disk {
     id              = 0
     size            = 50
     type            = "scsi"
     storage         = "local-lvm"
     storage_type    = "lvmthin"
     iothread        = false
   }

   network {
     id              = 0
     model           = "virtio"
     bridge          = "vmbr1"
   }

   # Cloud Init Settings
   ipconfig0         = "ip=202.57.162.199/24,gw=202.57.162.254"
   ciuser            = "root"
   cipassword        = "rNw4o7L@"
  
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
 }
