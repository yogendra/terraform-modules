
locals {
  project_config = {
    cidr   = "10.212.0.0/16"
    prefix = "icn-test",
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
      air-gapped = false,
      use-nat    = true,
      region     = "us-east-1",
      cidrs = [
        "10.212.104.0/21",
        "10.212.112.0/21"
      ],
      zones = [
        {
          name = "us-east-1a",
          cidr = "10.212.104.0/23",
          subnets = {
            public  = "10.212.104.0/24",
            private = "10.212.105.0/24"
          }
        },
        {
          name = "us-east-1b",
          cidr = "10.212.106.0/23",
          subnets = {
            public  = "10.212.106.0/24",
            private = "10.212.107.0/24"
          }
        },
        {
          name = "us-east-1c",
          cidr = "10.212.108.0/23",
          subnets = {
            public  = "10.212.108.0/24",
            private = "10.212.109.0/24"
          }
        },
        {
          name = "us-east-1d",
          cidr = "10.212.110.0/23",
          subnets = {
            public  = "10.212.110.0/24",
            private = "10.212.111.0/24"
          }
        },
        {
          name = "us-east-1e",
          cidr = "10.212.112.0/23",
          subnets = {
            public  = "10.212.112.0/24",
            private = "10.212.113.0/24"
          }
        },
        {
          name = "us-east-1f",
          cidr = "10.212.114.0/23",
          subnets = {
            public  = "10.212.114.0/24",
            private = "10.212.115.0/24"
          }
        }
      ]
    }
  }
}
