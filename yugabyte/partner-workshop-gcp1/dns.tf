
data "google_dns_managed_zone" "workshop-dns-zone" {
  name = var.dns-zone
}
resource "google_dns_record_set" "yugaware-dns" {
  for_each =  var.participants
  name = "yugaware-${each.key}.${var.domain}."
  type = "A"
  ttl  = 300
  managed_zone = var.dns-zone
  rrdatas = [ google_compute_instance.yugaware[each.key].network_interface.0.access_config.0.nat_ip]
}
resource "google_dns_record_set" "instructor-yugaware-dns" {

  name = "yugaware-instructor.${var.domain}."
  type = "A"
  ttl  = 300
  managed_zone = var.dns-zone
  rrdatas = [ google_compute_instance.instructor-yugaware.network_interface.0.access_config.0.nat_ip]
}
