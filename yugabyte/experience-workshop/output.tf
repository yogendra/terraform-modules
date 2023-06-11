locals {
  info = <<EOF
YBA
===
Version   : ${var.yba-release}
Portal    : https://${module.infra.yba-dns}
            https://${module.infra.yba-ip}
Username  : superadmin@yugabyte.com
Password  : ${var.default-password}
SSH       : gcloud compute ssh --zone "asia-southeast1-a" ${module.infra.yba.name} --project "apj-partner-enablement"  --tunnel-through-iap
Participant VMs
===============

%{ for i, p in module.participant ~}
Participant ${i+1}
===================
  User        : ${local.participants[i].name}
  App VM Name : ${p.app-vm.name}
  Address     : ${p.app-vm-dns}
                ${p.app-vm-ip}

  SSH Command : gcloud compute ssh --zone "asia-southeast1-a" ${p.app-vm.name} --project "apj-partner-enablement"  --tunnel-through-iap

  Code Server : https://${p.app-vm-dns}
                https://${p.app-vm-ip}
                Password: ${var.default-password}

  Sql Pad     : http://${p.app-vm-dns}:3000
                http://${p.app-vm-ip}:3000
                Username: superadmin@yugabyte.com
                Password: ${var.default-password}
  VM Link     : https://console.cloud.google.com/compute/instancesDetail/zones/asia-southeast1-a/instances/${p.app-vm.name}?project=apj-partner-enablement

%{ endfor ~}
Web : https://storage.cloud.google.com/${google_storage_bucket_object.info.bucket}/${google_storage_bucket_object.info.name}
EOF
}
output "info"{
  value = local.info
}
