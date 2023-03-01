
locals {
  project_config = {
    cidr   = "10.212.0.0/16"
    prefix = "tyba",
    ssh-public-keys = [
      file("${path.cwd}/private/test.pub")
    ]
    remote-ips = {
      "yrampuria"   = "127.0.0.1"
      "yrampuria-2" = "127.0.0.2"
    }
  }
  vpc_config = {
    ap-southeast-1 = {
      air-gapped = false,
      use-nat    = false,
      region     = "ap-southeast-1",
      cidrs = [
        "10.212.80.0/21"
      ],
      zones = [
        {
          name = "ap-southeast-1a",
          cidr = "10.212.80.0/23",
          subnets = {
            public  = "10.212.80.0/24",
            private = "10.212.81.0/24"
          }
        },
        {
          name = "ap-southeast-1b",
          cidr = "10.212.82.0/23",
          subnets = {
            public  = "10.212.82.0/24",
            private = "10.212.83.0/24"
          }
        },
        {
          name = "ap-southeast-1c",
          cidr = "10.212.84.0/23",
          subnets = {
            public  = "10.212.84.0/24",
            private = "10.212.85.0/24"
          }
        }
      ]
    },
    ap-southeast-2 = {
      air-gapped = false,
      use-nat    = false,
      region     = "ap-southeast-2",
      cidrs = [
        "10.212.88.0/21"
      ],
      zones = [
        {
          name = "ap-southeast-2a",
          cidr = "10.212.88.0/23",
          subnets = {
            public  = "10.212.88.0/24",
            private = "10.212.89.0/24"
          }
        },
        {
          name = "ap-southeast-2b",
          cidr = "10.212.90.0/23",
          subnets = {
            public  = "10.212.90.0/24",
            private = "10.212.91.0/24"
          }
        },
        {
          name = "ap-southeast-2c",
          cidr = "10.212.92.0/23",
          subnets = {
            public  = "10.212.92.0/24",
            private = "10.212.93.0/24"
          }
        }
      ]
    }
  }
}

