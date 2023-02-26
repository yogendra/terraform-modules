
locals {
  project_config = {
    cidr   = "10.45.0.0/16"
    prefix = "csn",
    ssh-public-keys = [
      file("${path.cwd}/private/test.pub")
    ]
    remote-ips = {
      "yrampuria"   = "127.0.0.1"
      "yrampuria-2" = "127.0.0.2"
    }
  }
  vpc_config = {
    us-east-1 = {
      air-gapped = true,
      use-nat    = false,
      region     = "us-east-1",
      cidrs = [
        "10.45.112.0/21",
        "10.45.120.0/21"
      ],
      zones = [
        {
          name = "us-east-1a",
          cidr = "10.45.112.0/23",
          subnets = {
            public = "10.45.112.0/25",
            app    = "10.45.112.128/25",
            db     = "10.45.113.0/25"
          }
        },
        {
          name = "us-east-1b",
          cidr = "10.45.114.0/23",
          subnets = {
            public = "10.45.114.0/25",
            app    = "10.45.114.128/25",
            db     = "10.45.115.0/25"
          }
        },
        {
          name = "us-east-1c",
          cidr = "10.45.116.0/23",
          subnets = {
            public = "10.45.116.0/25",
            app    = "10.45.116.128/25",
            db     = "10.45.117.0/25"
          }
        },
        {
          name = "us-east-1d",
          cidr = "10.45.118.0/23",
          subnets = {
            public = "10.45.118.0/25",
            app    = "10.45.118.128/25",
            db     = "10.45.119.0/25"
          }
        },
        {
          name = "us-east-1e",
          cidr = "10.45.120.0/23",
          subnets = {
            public = "10.45.120.0/25",
            app    = "10.45.120.128/25",
            db     = "10.45.121.0/25"
          }
        },
        {
          name = "us-east-1f",
          cidr = "10.45.122.0/23",
          subnets = {
            public = "10.45.122.0/25",
            app    = "10.45.122.128/25",
            db     = "10.45.123.0/25"
          }
        }
      ]
    }
  }
}

