locals {

info-html = <<EOF
<!document html>
<head>
  <title>${local.prefix} YugabyteDB Experience Workshop</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
  <style>
  tr.participant:nth-child(odd) {
    background-color: light-blue;
  }
  td, th {
    vertical-align: text-top;
    padding: 4px;

  }

  </style>
</head>
<body>
  <h1>YBA</h1>
  <table>
  <tr>
    <th>Portal</th>
    <td>
      <a href="https://${module.infra.yba-dns}">https://${module.infra.yba-dns}</a>
      <a href="https://${module.infra.yba-ip}">https://${module.infra.yba-ip}</a>
    <td>
  </tr>
  <tr>
    <th>Username</th>
    <td>superadmin@yugabyte.com</td>
  </tr>
  <tr>
    <th>Password</th>
    <td>${var.default-password}</td>
  </tr>
  </table>

  <h1>Participant VMs</h1>
  <table >
  %{ for i, p in module.participant ~}
    <tr class="participant">
    <th>
      <div>Participant ${i+1}</div>
      <div>${local.participants[i].name}</div>
    </th>
    <td>
      <table>
        <tr>
          <th>App VM</th>
          <td><a href="https://console.cloud.google.com/compute/instancesDetail/zones/asia-southeast1-a/instances/${p.app-vm.name}?project=apj-partner-enablement">${p.app-vm.name}</a></td>
        </tr>
        <tr>
          <th>Address</th>
          <td>
            <div>${p.app-vm-dns}</div>
            <div>${p.app-vm-ip}</div>
          </td>
        </tr>
        <tr>
          <th>SQL Pad</th>
          <td>
            <div><a href="http://${p.app-vm-dns}:3000">http://${p.app-vm-dns}:3000</a></div>
            <div><a href="http://${p.app-vm-ip}:3000">http://${p.app-vm-ip}:3000</a></div>
            <div>Password: ${var.default-password}</div>
          </td>
        </tr>
        <tr>
          <th>Code Server</th>
          <td>
            <div><a href="https://${p.app-vm-dns}">https://${p.app-vm-dns}</a></div>
            <div><a href="https://${p.app-vm-ip}">https://${p.app-vm-ip}</a></div>
            <div>Username: superadmin@yugabyte.com</div>
            <div>Password: ${var.default-password}</div>
          </td>
        </tr>
        <tr>
          <th></th>
          <td></td>
        </tr>
      </table>
    </td>
    </tr>
  %{ endfor ~}
  </table>
</body>
</html>
EOF
}
resource "google_storage_bucket_object" "info" {
  name   = "info.html"
  content_type = "text/html"
  content = local.info-html
  bucket = local.asset-bucket
}
