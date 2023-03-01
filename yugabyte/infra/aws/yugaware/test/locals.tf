locals {
  ssh-public-keys = [
    file("${path.cwd}/private/test.pub")
  ]
  remote-ips = {
    "yrampuria"   = "127.0.0.1"
    "yrampuria-2" = "127.0.0.2"
  }

}
