
locals {
  vpc_config = {
      ap-south-1 = {
        cidrs = [
          "10.212.0.0/21"
        ],
        zones = [
          {
            name = "ap-south-1a",
            cidr = "10.212.0.0/23",
            subnets = {
              public = "10.212.0.0/24",
              private = "10.212.1.0/24"
            }
          },
          {
            name = "ap-south-1b",
            cidr = "10.212.2.0/23",
            subnets = {
              public = "10.212.2.0/24",
              private = "10.212.3.0/24"
            }
          },
          {
            name = "ap-south-1c",
            cidr = "10.212.4.0/23",
            subnets = {
              public = "10.212.4.0/24",
              private = "10.212.5.0/24"
            }
          }
        ]
      },
      eu-north-1 = {
        cidrs = [
          "10.212.8.0/21"
        ],
        zones = [
          {
            name = "eu-north-1a",
            cidr = "10.212.8.0/23",
            subnets = {
              public = "10.212.8.0/24",
              private = "10.212.9.0/24"
            }
          },
          {
            name = "eu-north-1b",
            cidr = "10.212.10.0/23",
            subnets = {
              public = "10.212.10.0/24",
              private = "10.212.11.0/24"
            }
          },
          {
            name = "eu-north-1c",
            cidr = "10.212.12.0/23",
            subnets = {
              public = "10.212.12.0/24",
              private = "10.212.13.0/24"
            }
          }
        ]
      },
      eu-west-3 = {
        cidrs = [
          "10.212.16.0/21"
        ],
        zones = [
          {
            name = "eu-west-3a",
            cidr = "10.212.16.0/23",
            subnets = {
              public = "10.212.16.0/24",
              private = "10.212.17.0/24"
            }
          },
          {
            name = "eu-west-3b",
            cidr = "10.212.18.0/23",
            subnets = {
              public = "10.212.18.0/24",
              private = "10.212.19.0/24"
            }
          },
          {
            name = "eu-west-3c",
            cidr = "10.212.20.0/23",
            subnets = {
              public = "10.212.20.0/24",
              private = "10.212.21.0/24"
            }
          }
        ]
      },
      eu-west-2 = {
        cidrs = [
          "10.212.24.0/21"
        ],
        zones = [
          {
            name = "eu-west-2a",
            cidr = "10.212.24.0/23",
            subnets = {
              public = "10.212.24.0/24",
              private = "10.212.25.0/24"
            }
          },
          {
            name = "eu-west-2b",
            cidr = "10.212.26.0/23",
            subnets = {
              public = "10.212.26.0/24",
              private = "10.212.27.0/24"
            }
          },
          {
            name = "eu-west-2c",
            cidr = "10.212.28.0/23",
            subnets = {
              public = "10.212.28.0/24",
              private = "10.212.29.0/24"
            }
          }
        ]
      },
      eu-west-1 = {
        cidrs = [
          "10.212.32.0/21"
        ],
        zones = [
          {
            name = "eu-west-1a",
            cidr = "10.212.32.0/23",
            subnets = {
              public = "10.212.32.0/24",
              private = "10.212.33.0/24"
            }
          },
          {
            name = "eu-west-1b",
            cidr = "10.212.34.0/23",
            subnets = {
              public = "10.212.34.0/24",
              private = "10.212.35.0/24"
            }
          },
          {
            name = "eu-west-1c",
            cidr = "10.212.36.0/23",
            subnets = {
              public = "10.212.36.0/24",
              private = "10.212.37.0/24"
            }
          }
        ]
      },
      ap-northeast-3 = {
        cidrs = [
          "10.212.40.0/21"
        ],
        zones = [
          {
            name = "ap-northeast-3a",
            cidr = "10.212.40.0/23",
            subnets = {
              public = "10.212.40.0/24",
              private = "10.212.41.0/24"
            }
          },
          {
            name = "ap-northeast-3b",
            cidr = "10.212.42.0/23",
            subnets = {
              public = "10.212.42.0/24",
              private = "10.212.43.0/24"
            }
          },
          {
            name = "ap-northeast-3c",
            cidr = "10.212.44.0/23",
            subnets = {
              public = "10.212.44.0/24",
              private = "10.212.45.0/24"
            }
          }
        ]
      },
      ap-northeast-2 = {
        cidrs = [
          "10.212.48.0/21"
        ],
        zones = [
          {
            name = "ap-northeast-2a",
            cidr = "10.212.48.0/23",
            subnets = {
              public = "10.212.48.0/24",
              private = "10.212.49.0/24"
            }
          },
          {
            name = "ap-northeast-2b",
            cidr = "10.212.50.0/23",
            subnets = {
              public = "10.212.50.0/24",
              private = "10.212.51.0/24"
            }
          },
          {
            name = "ap-northeast-2c",
            cidr = "10.212.52.0/23",
            subnets = {
              public = "10.212.52.0/24",
              private = "10.212.53.0/24"
            }
          },
          {
            name = "ap-northeast-2d",
            cidr = "10.212.54.0/23",
            subnets = {
              public = "10.212.54.0/24",
              private = "10.212.55.0/24"
            }
          }
        ]
      },
      ap-northeast-1 = {
        cidrs = [
          "10.212.56.0/21"
        ],
        zones = [
          {
            name = "ap-northeast-1a",
            cidr = "10.212.56.0/23",
            subnets = {
              public = "10.212.56.0/24",
              private = "10.212.57.0/24"
            }
          },
          {
            name = "ap-northeast-1c",
            cidr = "10.212.58.0/23",
            subnets = {
              public = "10.212.58.0/24",
              private = "10.212.59.0/24"
            }
          },
          {
            name = "ap-northeast-1d",
            cidr = "10.212.60.0/23",
            subnets = {
              public = "10.212.60.0/24",
              private = "10.212.61.0/24"
            }
          }
        ]
      },
      ca-central-1 = {
        cidrs = [
          "10.212.64.0/21"
        ],
        zones = [
          {
            name = "ca-central-1a",
            cidr = "10.212.64.0/23",
            subnets = {
              public = "10.212.64.0/24",
              private = "10.212.65.0/24"
            }
          },
          {
            name = "ca-central-1b",
            cidr = "10.212.66.0/23",
            subnets = {
              public = "10.212.66.0/24",
              private = "10.212.67.0/24"
            }
          },
          {
            name = "ca-central-1d",
            cidr = "10.212.68.0/23",
            subnets = {
              public = "10.212.68.0/24",
              private = "10.212.69.0/24"
            }
          }
        ]
      },
      sa-east-1 = {
        cidrs = [
          "10.212.72.0/21"
        ],
        zones = [
          {
            name = "sa-east-1a",
            cidr = "10.212.72.0/23",
            subnets = {
              public = "10.212.72.0/24",
              private = "10.212.73.0/24"
            }
          },
          {
            name = "sa-east-1b",
            cidr = "10.212.74.0/23",
            subnets = {
              public = "10.212.74.0/24",
              private = "10.212.75.0/24"
            }
          },
          {
            name = "sa-east-1c",
            cidr = "10.212.76.0/23",
            subnets = {
              public = "10.212.76.0/24",
              private = "10.212.77.0/24"
            }
          }
        ]
      },
      ap-southeast-1 = {
        cidrs = [
          "10.212.80.0/21"
        ],
        zones = [
          {
            name = "ap-southeast-1a",
            cidr = "10.212.80.0/23",
            subnets = {
              public = "10.212.80.0/24",
              private = "10.212.81.0/24"
            }
          },
          {
            name = "ap-southeast-1b",
            cidr = "10.212.82.0/23",
            subnets = {
              public = "10.212.82.0/24",
              private = "10.212.83.0/24"
            }
          },
          {
            name = "ap-southeast-1c",
            cidr = "10.212.84.0/23",
            subnets = {
              public = "10.212.84.0/24",
              private = "10.212.85.0/24"
            }
          }
        ]
      },
      ap-southeast-2 = {
        cidrs = [
          "10.212.88.0/21"
        ],
        zones = [
          {
            name = "ap-southeast-2a",
            cidr = "10.212.88.0/23",
            subnets = {
              public = "10.212.88.0/24",
              private = "10.212.89.0/24"
            }
          },
          {
            name = "ap-southeast-2b",
            cidr = "10.212.90.0/23",
            subnets = {
              public = "10.212.90.0/24",
              private = "10.212.91.0/24"
            }
          },
          {
            name = "ap-southeast-2c",
            cidr = "10.212.92.0/23",
            subnets = {
              public = "10.212.92.0/24",
              private = "10.212.93.0/24"
            }
          }
        ]
      },
      eu-central-1 = {
        cidrs = [
          "10.212.96.0/21"
        ],
        zones = [
          {
            name = "eu-central-1a",
            cidr = "10.212.96.0/23",
            subnets = {
              public = "10.212.96.0/24",
              private = "10.212.97.0/24"
            }
          },
          {
            name = "eu-central-1b",
            cidr = "10.212.98.0/23",
            subnets = {
              public = "10.212.98.0/24",
              private = "10.212.99.0/24"
            }
          },
          {
            name = "eu-central-1c",
            cidr = "10.212.100.0/23",
            subnets = {
              public = "10.212.100.0/24",
              private = "10.212.101.0/24"
            }
          }
        ]
      },
      us-east-1 = {
        cidrs = [
          "10.212.104.0/21",
          "10.212.112.0/21"
        ],
        zones = [
          {
            name = "us-east-1a",
            cidr = "10.212.104.0/23",
            subnets = {
              public = "10.212.104.0/24",
              private = "10.212.105.0/24"
            }
          },
          {
            name = "us-east-1b",
            cidr = "10.212.106.0/23",
            subnets = {
              public = "10.212.106.0/24",
              private = "10.212.107.0/24"
            }
          },
          {
            name = "us-east-1c",
            cidr = "10.212.108.0/23",
            subnets = {
              public = "10.212.108.0/24",
              private = "10.212.109.0/24"
            }
          },
          {
            name = "us-east-1d",
            cidr = "10.212.110.0/23",
            subnets = {
              public = "10.212.110.0/24",
              private = "10.212.111.0/24"
            }
          },
          {
            name = "us-east-1e",
            cidr = "10.212.112.0/23",
            subnets = {
              public = "10.212.112.0/24",
              private = "10.212.113.0/24"
            }
          },
          {
            name = "us-east-1f",
            cidr = "10.212.114.0/23",
            subnets = {
              public = "10.212.114.0/24",
              private = "10.212.115.0/24"
            }
          }
        ]
      },
      us-east-2 = {
        cidrs = [
          "10.212.120.0/21"
        ],
        zones = [
          {
            name = "us-east-2a",
            cidr = "10.212.120.0/23",
            subnets = {
              public = "10.212.120.0/24",
              private = "10.212.121.0/24"
            }
          },
          {
            name = "us-east-2b",
            cidr = "10.212.122.0/23",
            subnets = {
              public = "10.212.122.0/24",
              private = "10.212.123.0/24"
            }
          },
          {
            name = "us-east-2c",
            cidr = "10.212.124.0/23",
            subnets = {
              public = "10.212.124.0/24",
              private = "10.212.125.0/24"
            }
          }
        ]
      },
      us-west-1 = {
        cidrs = [
          "10.212.128.0/21"
        ],
        zones = [
          {
            name = "us-west-1a",
            cidr = "10.212.128.0/23",
            subnets = {
              public = "10.212.128.0/24",
              private = "10.212.129.0/24"
            }
          },
          {
            name = "us-west-1c",
            cidr = "10.212.130.0/23",
            subnets = {
              public = "10.212.130.0/24",
              private = "10.212.131.0/24"
            }
          }
        ]
      },
      us-west-2 = {
        cidrs = [
          "10.212.136.0/21"
        ],
        zones = [
          {
            name = "us-west-2a",
            cidr = "10.212.136.0/23",
            subnets = {
              public = "10.212.136.0/24",
              private = "10.212.137.0/24"
            }
          },
          {
            name = "us-west-2b",
            cidr = "10.212.138.0/23",
            subnets = {
              public = "10.212.138.0/24",
              private = "10.212.139.0/24"
            }
          },
          {
            name = "us-west-2c",
            cidr = "10.212.140.0/23",
            subnets = {
              public = "10.212.140.0/24",
              private = "10.212.141.0/24"
            }
          },
          {
            name = "us-west-2d",
            cidr = "10.212.142.0/23",
            subnets = {
              public = "10.212.142.0/24",
              private = "10.212.143.0/24"
            }
          }
        ]
      }
    }
}
  
