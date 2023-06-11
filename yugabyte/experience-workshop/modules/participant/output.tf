output "app-vm" {
  value = google_compute_instance.app-vm
}

output "app-vm-dns" {
  value = "p${var.participant-id}-app-vm.${var.domain}"
}

output "app-vm-ip" {
  value = google_compute_instance.app-vm.network_interface.0.access_config.0.nat_ip
}

