

resource "google_storage_bucket" "workshop-site" {
  name = local.workshop_instruction_bucket
  location = var.gcs-region
  force_destroy = true
  uniform_bucket_level_access = true


  # website {
  #   main_page_suffix = "index.html"
  #   not_found_page   = "404.html"
  # }
  # cors {
  #   origin          = ["*"]
  #   method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
  #   response_header = ["*"]
  #   max_age_seconds = 3600
  # }
}


resource "google_storage_bucket_object" "license-file" {
  name   = local.license_filename
  content_type = "application/octet-stream"
  source = var.license-file
  bucket = google_storage_bucket.workshop-site.name
}

resource "google_storage_bucket_object" "sa-key" {
  name   = local.cloud_sa_key_filename
  content_type = "application/octet-stream"
  content = base64decode(google_service_account_key.yugabyte-sa-key.private_key)
  bucket = google_storage_bucket.workshop-site.name
}


resource "google_storage_bucket_object" "http-cert" {
  name   = local.http_cert_filename
  content_type = "application/octet-stream"
  content = acme_certificate.certificate.certificate_pem
  bucket = google_storage_bucket.workshop-site.name
}
resource "google_storage_bucket_object" "http-cert-full" {
  name   = local.http_cert_full_filename
  content_type = "application/octet-stream"
  content     = "${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}"
  bucket = google_storage_bucket.workshop-site.name
}


resource "google_storage_bucket_object" "http-cert-key" {
  name   = local.http_cert_key_filename
  content_type = "application/octet-stream"
  content     = acme_certificate.certificate.private_key_pem
  bucket = google_storage_bucket.workshop-site.name
}

resource "google_storage_bucket_object" "http-cert-issuer" {
  name   = local.http_cert_issuer_filename
  content_type = "application/octet-stream"
  content     = acme_certificate.certificate.issuer_pem
  bucket = google_storage_bucket.workshop-site.name
}



locals{
  instructions_html = <<EOT
  <!document html>
  <html lang="en">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>${var.prefix} - Workshop Instruction</title>
      <style>
      td, td *, th, th * {
          vertical-align: top;
      }
      td ul{
        list-style-type: none;
      }
      th.in-body {
        text-align:right;
      }
      table {
        border-collapse: collapse;
        width: 100%;
      }

      th, td {
        text-align: left;
        padding: 8px;
      }

      tr:nth-child(even) {background-color: #f2f2f2;}
      tr tr:nth-child(even) { background-color: #00000000; }


      </style>
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

      <!-- Optional theme -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

      <!-- Latest compiled and minified JavaScript -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
      <!--[if lt IE 9]>
        <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
      <![endif]-->
    </head>
    <body>

      <h1>${var.prefix} - Workshop Instruction</h1>

      <h2>Basic Setup</h2>
      <ul>
        <li>Instructors can connect to any VM</li>
        <li>Participants can only connect to their own VM</li>
        <li>Firewall ports have been opened for accessing all known services</li>
        <li>VM for YugabyteDB Anywhere is already created</li>
        <li>Bucket for Backup / Restore is already created</li>
        <li>Service account is already created and its JSON key will be provided by instructors</li>
        <li>License file (.rli) will be provided by instructors</li>
        <li>Download and install the 'gcloud' command line on your workstation (recommended) or use cloud shell on google console.</li>
        <li><a href="https://cloud.google.com/sdk/docs/install">Install gcloud Command</a></li>
        <li><a href="https://docs.yugabyte.com/preview/yugabyte-platform/install-yugabyte-platform/prepare-environment/gcp/">Yugaware installation instructions</a></li>
      </ul>

      <h2>Files</h2>

      <ul>
        <li>
          <a href="${local.workshop_home}/${local.license_filename}">License File</a>
        </li>
        <li>
          <details>
            <summary>
              <a href="${local.workshop_home}/${local.cloud_sa_key_filename}">Service Account Key</a>
            </summary>
            <pre>${base64decode(google_service_account_key.yugabyte-sa-key.private_key)}</pre>
          </details>
        </li>
        <li>
          HTTPS Certificate
          <ul>
            <li>
              <details>
                <summary>
                  <a href="${local.workshop_home}/${local.http_cert_key_filename}">Private Key</a>
                </summary>
                <pre>${acme_certificate.certificate.private_key_pem}</pre>
              </details>
            </li>
            <li>
              <details>
                <summary>
                  <a href="${local.workshop_home}/${local.http_cert_full_filename}">Certificate (Full)</a>
                </summary>
                <pre>${acme_certificate.certificate.certificate_pem}${acme_certificate.certificate.issuer_pem}</pre>
              </details>
            </li>
            <li>
              <details>
                <summary>
                  <a href="${local.workshop_home}/${local.http_cert_filename}">Certificate </a>
                </summary>
                <pre>${acme_certificate.certificate.certificate_pem}</pre>
              </details>
            </li>
            <li>
              <details>
                <summary>
                  <a href="${local.workshop_home}/${local.http_cert_issuer_filename}">Issuer Certificate </a>
                </summary>
                <pre>${acme_certificate.certificate.issuer_pem}</pre>
              </details>
            </li>
          </ul>
        </li>
      </ul>

      <h2>Machines/Compute</h2>

      <table class="stripped">
        <tr>
          <th>Group</th>
          <th>Member</th>
          <th>Information</th>
        <tr>
        <tr>
          <td>Instructors</td>
          <td>
            <ul>
            %{ for email in var.instructors }
              <li>${email}</li>
            %{ endfor}
            </ul>
          </td>
          <td>
            <table>
              <tr><th class="in-body">VM</th><td>${google_compute_instance.instructor-yugaware.name}</td> </tr>
              <tr><th class="in-body">Bucket</th><td>${google_storage_bucket.instructor-backup-bucket.name}</td>
              <tr><th class="in-body">SSH Command</th><td><pre>gcloud compute ssh ${google_compute_instance.instructor-yugaware.name} --project ${var.gcp-project-id} --zone ${var.primary-zone} --tunnel-through-iap</pre></td></tr>
              <tr><th class="in-body">FQDN</th><td>yugaware.instructor.${var.domain}</td></tr>
              <tr><th class="in-body">Portal</th><td><a href="http://yugaware-instructor.${var.domain}">http://yugaware-instructor.${var.domain}</a></td></tr>
              <tr><th class="in-body">Replicated</th><td><a href="http://yugaware-instructor.${var.domain}:8800">http://yugaware-instructor.${var.domain}:8800</a></td></tr>
            </table>
          </td>
        </tr>
        %{ for org, emails in var.participants }
        <tr>
          <td>${org}</td>
          <td>
            <ul>
            %{ for email in emails }
              <li>${email}</li>
            %{ endfor}
            </ul>
          </td>
          <td>
            <table>
              <tbody>
                <tr><th class="in-body">VM</th><td>${google_compute_instance.yugaware[org].name}</td> </tr>
                <tr><th class="in-body">Bucket</th><td>${google_storage_bucket.backup-bucket[org].name}</td>
                <tr><th class="in-body">SSH Command</th><td><pre>gcloud compute ssh ${google_compute_instance.yugaware[org].name} --project ${var.gcp-project-id} --zone ${var.primary-zone} --tunnel-through-iap</pre></td></tr>
                <tr><th class="in-body">FQDN</th><td>yugaware-${org}.${var.domain}</td></tr>
                <tr><th class="in-body">Portal</th><td><a href="http://yugaware-${org}.${var.domain}">http://yugaware-${org}.${var.domain}</a></td></tr>
                <tr><th class="in-body">Replicated</th><td><a href="http://yugaware-${org}.${var.domain}:8800">http://yugaware-${org}.${var.domain}:8800</a></td></tr>
              </tbody>
            </table>
          </td>
        </tr>
        %{ endfor}
      </table>

      <h2>Cloud Network</h2>
      <ul>
        <li>Network: ${var.gcp-network}</li>
        <li>
        Regionalwise Subnets
          <table>
            <tr>
              <th>Region</th>
              <th>Subnet</th>
            </tr>
            %{ for subnet in data.google_compute_subnetwork.regional-subnet}
            <tr>
              <td>${subnet.region}</td>
              <td>${subnet.name}</td>
            </tr>
            %{ endfor }
          </table>
        </li>
      </ul>


      <h2>All attendees emails</h2>
      <ul>
      %{ for email in local.attendees-email-list}
        <li>${email}</li>
      %{ endfor }
      </ul>
  </body>
</html>
EOT
}

resource "google_storage_bucket_object" "homepage" {
  name   = "index.html"
  content_type = "text/html"
  content = local.instructions_html
  bucket = google_storage_bucket.workshop-site.name
}
