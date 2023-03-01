
locals {
  project_config = {
    cidr            = "10.212.0.0/16"
    prefix          = "tyba",
    ssh-public-keys = local.ssh-public-keys
    remote-ips      = local.remote-ips
  }
  vpc_config = {
    ap-southeast-1 = {
      air-gapped = false,
      use-nat    = true,
      region     = "ap-southeast-1",
      cidrs = [
        "10.212.0.0/21"
      ],
      zones = [
        {
          name = "ap-southeast-1a",
          cidr = "10.212.0.0/23",
          subnets = {
            public  = "10.212.0.0/24",
            private = "10.212.1.0/24"
          }
        },
        {
          name = "ap-southeast-1b",
          cidr = "10.212.2.0/23",
          subnets = {
            public  = "10.212.2.0/24",
            private = "10.212.3.0/24"
          }
        },
        {
          name = "ap-southeast-1c",
          cidr = "10.212.4.0/23",
          subnets = {
            public  = "10.212.4.0/24",
            private = "10.212.5.0/24"
          }
        }
      ]
    },
    ap-southeast-2 = {
      air-gapped = true,
      use-nat    = false,
      region     = "ap-southeast-2",
      cidrs = [
        "10.212.8.0/21"
      ],
      zones = [
        {
          name = "ap-southeast-2a",
          cidr = "10.212.8.0/23",
          subnets = {
            public  = "10.212.8.0/24",
            private = "10.212.9.0/24"
          }
        },
        {
          name = "ap-southeast-2b",
          cidr = "10.212.10.0/23",
          subnets = {
            public  = "10.212.10.0/24",
            private = "10.212.11.0/24"
          }
        },
        {
          name = "ap-southeast-2c",
          cidr = "10.212.12.0/23",
          subnets = {
            public  = "10.212.12.0/24",
            private = "10.212.13.0/24"
          }
        }
      ]
    }
  }
}

