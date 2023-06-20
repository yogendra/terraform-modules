module "peer-af-south-1-ap-east-1" {
  count = (local.enabled.af-south-1 && local.enabled.ap-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-east-1.vpc-id
	dest_route_tables =  local.vpcs.ap-east-1.route-tables
	dest_cidrs = local.vpcs.ap-east-1.vpc-cidrs
	dest_region = local.vpcs.ap-east-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_east_1
  }
}

module "peer-af-south-1-ap-northeast-1" {
  count = (local.enabled.af-south-1 && local.enabled.ap-northeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-northeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-1.route-tables
	dest_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_northeast_1
  }
}

module "peer-af-south-1-ap-northeast-2" {
  count = (local.enabled.af-south-1 && local.enabled.ap-northeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-northeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-2.route-tables
	dest_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_northeast_2
  }
}

module "peer-af-south-1-ap-northeast-3" {
  count = (local.enabled.af-south-1 && local.enabled.ap-northeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-northeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-3.route-tables
	dest_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-3.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_northeast_3
  }
}

module "peer-af-south-1-ap-south-1" {
  count = (local.enabled.af-south-1 && local.enabled.ap-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-south-1.vpc-id
	dest_route_tables =  local.vpcs.ap-south-1.route-tables
	dest_cidrs = local.vpcs.ap-south-1.vpc-cidrs
	dest_region = local.vpcs.ap-south-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_south_1
  }
}

module "peer-af-south-1-ap-south-2" {
  count = (local.enabled.af-south-1 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_south_2
  }
}

module "peer-af-south-1-ap-southeast-1" {
  count = (local.enabled.af-south-1 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-af-south-1-ap-southeast-2" {
  count = (local.enabled.af-south-1 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-af-south-1-ap-southeast-3" {
  count = (local.enabled.af-south-1 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-af-south-1-ap-southeast-4" {
  count = (local.enabled.af-south-1 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-af-south-1-ca-central-1" {
  count = (local.enabled.af-south-1 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ca_central_1
  }
}

module "peer-af-south-1-eu-central-1" {
  count = (local.enabled.af-south-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-af-south-1-eu-central-2" {
  count = (local.enabled.af-south-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-af-south-1-eu-north-1" {
  count = (local.enabled.af-south-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-af-south-1-eu-south-1" {
  count = (local.enabled.af-south-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-af-south-1-eu-south-2" {
  count = (local.enabled.af-south-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-af-south-1-eu-west-1" {
  count = (local.enabled.af-south-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-af-south-1-eu-west-2" {
  count = (local.enabled.af-south-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-af-south-1-eu-west-3" {
  count = (local.enabled.af-south-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-af-south-1-me-central-1" {
  count = (local.enabled.af-south-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.me_central_1
  }
}

module "peer-af-south-1-me-south-1" {
  count = (local.enabled.af-south-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.me_south_1
  }
}

module "peer-af-south-1-sa-east-1" {
  count = (local.enabled.af-south-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-af-south-1-us-east-1" {
  count = (local.enabled.af-south-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_east_1
  }
}

module "peer-af-south-1-us-east-2" {
  count = (local.enabled.af-south-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_east_2
  }
}

module "peer-af-south-1-us-west-1" {
  count = (local.enabled.af-south-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_west_1
  }
}

module "peer-af-south-1-us-west-2" {
  count = (local.enabled.af-south-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.af-south-1.vpc-id
	src_route_tables =  local.vpcs.af-south-1.route-tables
	src_cidrs = local.vpcs.af-south-1.vpc-cidrs
  src_region = local.vpcs.af-south-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-east-1-ap-northeast-1" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-northeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-northeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-1.route-tables
	dest_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_northeast_1
  }
}

module "peer-ap-east-1-ap-northeast-2" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-northeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-northeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-2.route-tables
	dest_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_northeast_2
  }
}

module "peer-ap-east-1-ap-northeast-3" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-northeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-northeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-3.route-tables
	dest_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-3.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_northeast_3
  }
}

module "peer-ap-east-1-ap-south-1" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-south-1.vpc-id
	dest_route_tables =  local.vpcs.ap-south-1.route-tables
	dest_cidrs = local.vpcs.ap-south-1.vpc-cidrs
	dest_region = local.vpcs.ap-south-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_south_1
  }
}

module "peer-ap-east-1-ap-south-2" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_south_2
  }
}

module "peer-ap-east-1-ap-southeast-1" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-east-1-ap-southeast-2" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-east-1-ap-southeast-3" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-east-1-ap-southeast-4" {
  count = (local.enabled.ap-east-1 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-east-1-ca-central-1" {
  count = (local.enabled.ap-east-1 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-east-1-eu-central-1" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-east-1-eu-central-2" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-east-1-eu-north-1" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-east-1-eu-south-1" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-east-1-eu-south-2" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-east-1-eu-west-1" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-east-1-eu-west-2" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-east-1-eu-west-3" {
  count = (local.enabled.ap-east-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-east-1-me-central-1" {
  count = (local.enabled.ap-east-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-east-1-me-south-1" {
  count = (local.enabled.ap-east-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-east-1-sa-east-1" {
  count = (local.enabled.ap-east-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-east-1-us-east-1" {
  count = (local.enabled.ap-east-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-east-1-us-east-2" {
  count = (local.enabled.ap-east-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-east-1-us-west-1" {
  count = (local.enabled.ap-east-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-east-1-us-west-2" {
  count = (local.enabled.ap-east-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-east-1.vpc-id
	src_route_tables =  local.vpcs.ap-east-1.route-tables
	src_cidrs = local.vpcs.ap-east-1.vpc-cidrs
  src_region = local.vpcs.ap-east-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-northeast-1-ap-northeast-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-northeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-northeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-2.route-tables
	dest_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_northeast_2
  }
}

module "peer-ap-northeast-1-ap-northeast-3" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-northeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-northeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-3.route-tables
	dest_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-3.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_northeast_3
  }
}

module "peer-ap-northeast-1-ap-south-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-south-1.vpc-id
	dest_route_tables =  local.vpcs.ap-south-1.route-tables
	dest_cidrs = local.vpcs.ap-south-1.vpc-cidrs
	dest_region = local.vpcs.ap-south-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_south_1
  }
}

module "peer-ap-northeast-1-ap-south-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_south_2
  }
}

module "peer-ap-northeast-1-ap-southeast-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-northeast-1-ap-southeast-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-northeast-1-ap-southeast-3" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-northeast-1-ap-southeast-4" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-northeast-1-ca-central-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-northeast-1-eu-central-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-northeast-1-eu-central-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-northeast-1-eu-north-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-northeast-1-eu-south-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-northeast-1-eu-south-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-northeast-1-eu-west-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-northeast-1-eu-west-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-northeast-1-eu-west-3" {
  count = (local.enabled.ap-northeast-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-northeast-1-me-central-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-northeast-1-me-south-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-northeast-1-sa-east-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-northeast-1-us-east-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-northeast-1-us-east-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-northeast-1-us-west-1" {
  count = (local.enabled.ap-northeast-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-northeast-1-us-west-2" {
  count = (local.enabled.ap-northeast-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-1.route-tables
	src_cidrs = local.vpcs.ap-northeast-1.vpc-cidrs
  src_region = local.vpcs.ap-northeast-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-northeast-2-ap-northeast-3" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-northeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-northeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-northeast-3.route-tables
	dest_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-northeast-3.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_northeast_3
  }
}

module "peer-ap-northeast-2-ap-south-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-south-1.vpc-id
	dest_route_tables =  local.vpcs.ap-south-1.route-tables
	dest_cidrs = local.vpcs.ap-south-1.vpc-cidrs
	dest_region = local.vpcs.ap-south-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_south_1
  }
}

module "peer-ap-northeast-2-ap-south-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_south_2
  }
}

module "peer-ap-northeast-2-ap-southeast-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-northeast-2-ap-southeast-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-northeast-2-ap-southeast-3" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-northeast-2-ap-southeast-4" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-northeast-2-ca-central-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-northeast-2-eu-central-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-northeast-2-eu-central-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-northeast-2-eu-north-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-northeast-2-eu-south-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-northeast-2-eu-south-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-northeast-2-eu-west-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-northeast-2-eu-west-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-northeast-2-eu-west-3" {
  count = (local.enabled.ap-northeast-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-northeast-2-me-central-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-northeast-2-me-south-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-northeast-2-sa-east-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-northeast-2-us-east-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-northeast-2-us-east-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-northeast-2-us-west-1" {
  count = (local.enabled.ap-northeast-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-northeast-2-us-west-2" {
  count = (local.enabled.ap-northeast-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-2.route-tables
	src_cidrs = local.vpcs.ap-northeast-2.vpc-cidrs
  src_region = local.vpcs.ap-northeast-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-northeast-3-ap-south-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-south-1.vpc-id
	dest_route_tables =  local.vpcs.ap-south-1.route-tables
	dest_cidrs = local.vpcs.ap-south-1.vpc-cidrs
	dest_region = local.vpcs.ap-south-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_south_1
  }
}

module "peer-ap-northeast-3-ap-south-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_south_2
  }
}

module "peer-ap-northeast-3-ap-southeast-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-northeast-3-ap-southeast-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-northeast-3-ap-southeast-3" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-northeast-3-ap-southeast-4" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-northeast-3-ca-central-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-northeast-3-eu-central-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-northeast-3-eu-central-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-northeast-3-eu-north-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-northeast-3-eu-south-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-northeast-3-eu-south-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-northeast-3-eu-west-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-northeast-3-eu-west-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-northeast-3-eu-west-3" {
  count = (local.enabled.ap-northeast-3 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-northeast-3-me-central-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-northeast-3-me-south-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-northeast-3-sa-east-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-northeast-3-us-east-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-northeast-3-us-east-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-northeast-3-us-west-1" {
  count = (local.enabled.ap-northeast-3 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-northeast-3-us-west-2" {
  count = (local.enabled.ap-northeast-3 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-northeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-northeast-3.route-tables
	src_cidrs = local.vpcs.ap-northeast-3.vpc-cidrs
  src_region = local.vpcs.ap-northeast-3.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-south-1-ap-south-2" {
  count = (local.enabled.ap-south-1 && local.enabled.ap-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ap-south-2.vpc-id
	dest_route_tables =  local.vpcs.ap-south-2.route-tables
	dest_cidrs = local.vpcs.ap-south-2.vpc-cidrs
	dest_region = local.vpcs.ap-south-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_south_2
  }
}

module "peer-ap-south-1-ap-southeast-1" {
  count = (local.enabled.ap-south-1 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-south-1-ap-southeast-2" {
  count = (local.enabled.ap-south-1 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-south-1-ap-southeast-3" {
  count = (local.enabled.ap-south-1 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-south-1-ap-southeast-4" {
  count = (local.enabled.ap-south-1 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-south-1-ca-central-1" {
  count = (local.enabled.ap-south-1 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-south-1-eu-central-1" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-south-1-eu-central-2" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-south-1-eu-north-1" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-south-1-eu-south-1" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-south-1-eu-south-2" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-south-1-eu-west-1" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-south-1-eu-west-2" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-south-1-eu-west-3" {
  count = (local.enabled.ap-south-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-south-1-me-central-1" {
  count = (local.enabled.ap-south-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-south-1-me-south-1" {
  count = (local.enabled.ap-south-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-south-1-sa-east-1" {
  count = (local.enabled.ap-south-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-south-1-us-east-1" {
  count = (local.enabled.ap-south-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-south-1-us-east-2" {
  count = (local.enabled.ap-south-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-south-1-us-west-1" {
  count = (local.enabled.ap-south-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-south-1-us-west-2" {
  count = (local.enabled.ap-south-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-1.vpc-id
	src_route_tables =  local.vpcs.ap-south-1.route-tables
	src_cidrs = local.vpcs.ap-south-1.vpc-cidrs
  src_region = local.vpcs.ap-south-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-south-2-ap-southeast-1" {
  count = (local.enabled.ap-south-2 && local.enabled.ap-southeast-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.ap-southeast-1.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-1.route-tables
	dest_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_1
  }
}

module "peer-ap-south-2-ap-southeast-2" {
  count = (local.enabled.ap-south-2 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-south-2-ap-southeast-3" {
  count = (local.enabled.ap-south-2 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-south-2-ap-southeast-4" {
  count = (local.enabled.ap-south-2 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-south-2-ca-central-1" {
  count = (local.enabled.ap-south-2 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-south-2-eu-central-1" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-south-2-eu-central-2" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-south-2-eu-north-1" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-south-2-eu-south-1" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-south-2-eu-south-2" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-south-2-eu-west-1" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-south-2-eu-west-2" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-south-2-eu-west-3" {
  count = (local.enabled.ap-south-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-south-2-me-central-1" {
  count = (local.enabled.ap-south-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-south-2-me-south-1" {
  count = (local.enabled.ap-south-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-south-2-sa-east-1" {
  count = (local.enabled.ap-south-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-south-2-us-east-1" {
  count = (local.enabled.ap-south-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-south-2-us-east-2" {
  count = (local.enabled.ap-south-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-south-2-us-west-1" {
  count = (local.enabled.ap-south-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-south-2-us-west-2" {
  count = (local.enabled.ap-south-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-south-2.vpc-id
	src_route_tables =  local.vpcs.ap-south-2.route-tables
	src_cidrs = local.vpcs.ap-south-2.vpc-cidrs
  src_region = local.vpcs.ap-south-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-southeast-1-ap-southeast-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.ap-southeast-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-2.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-2.route-tables
	dest_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_2
  }
}

module "peer-ap-southeast-1-ap-southeast-3" {
  count = (local.enabled.ap-southeast-1 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-southeast-1-ap-southeast-4" {
  count = (local.enabled.ap-southeast-1 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-southeast-1-ca-central-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-southeast-1-eu-central-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-southeast-1-eu-central-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-southeast-1-eu-north-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-southeast-1-eu-south-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-southeast-1-eu-south-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-southeast-1-eu-west-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-southeast-1-eu-west-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-southeast-1-eu-west-3" {
  count = (local.enabled.ap-southeast-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-southeast-1-me-central-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-southeast-1-me-south-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-southeast-1-sa-east-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-southeast-1-us-east-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-southeast-1-us-east-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-southeast-1-us-west-1" {
  count = (local.enabled.ap-southeast-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-southeast-1-us-west-2" {
  count = (local.enabled.ap-southeast-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-1.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-1.route-tables
	src_cidrs = local.vpcs.ap-southeast-1.vpc-cidrs
  src_region = local.vpcs.ap-southeast-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-southeast-2-ap-southeast-3" {
  count = (local.enabled.ap-southeast-2 && local.enabled.ap-southeast-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-3.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-3.route-tables
	dest_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-3.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.ap_southeast_3
  }
}

module "peer-ap-southeast-2-ap-southeast-4" {
  count = (local.enabled.ap-southeast-2 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-southeast-2-ca-central-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-southeast-2-eu-central-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-southeast-2-eu-central-2" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-southeast-2-eu-north-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-southeast-2-eu-south-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-southeast-2-eu-south-2" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-southeast-2-eu-west-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-southeast-2-eu-west-2" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-southeast-2-eu-west-3" {
  count = (local.enabled.ap-southeast-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-southeast-2-me-central-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-southeast-2-me-south-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-southeast-2-sa-east-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-southeast-2-us-east-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-southeast-2-us-east-2" {
  count = (local.enabled.ap-southeast-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-southeast-2-us-west-1" {
  count = (local.enabled.ap-southeast-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-southeast-2-us-west-2" {
  count = (local.enabled.ap-southeast-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-2.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-2.route-tables
	src_cidrs = local.vpcs.ap-southeast-2.vpc-cidrs
  src_region = local.vpcs.ap-southeast-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-southeast-3-ap-southeast-4" {
  count = (local.enabled.ap-southeast-3 && local.enabled.ap-southeast-4) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.ap-southeast-4.vpc-id
	dest_route_tables =  local.vpcs.ap-southeast-4.route-tables
	dest_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
	dest_region = local.vpcs.ap-southeast-4.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_southeast_4
  }
}

module "peer-ap-southeast-3-ca-central-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-southeast-3-eu-central-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-southeast-3-eu-central-2" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-southeast-3-eu-north-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-southeast-3-eu-south-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-southeast-3-eu-south-2" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-southeast-3-eu-west-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-southeast-3-eu-west-2" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-southeast-3-eu-west-3" {
  count = (local.enabled.ap-southeast-3 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-southeast-3-me-central-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-southeast-3-me-south-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-southeast-3-sa-east-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-southeast-3-us-east-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-southeast-3-us-east-2" {
  count = (local.enabled.ap-southeast-3 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-southeast-3-us-west-1" {
  count = (local.enabled.ap-southeast-3 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-southeast-3-us-west-2" {
  count = (local.enabled.ap-southeast-3 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-3.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-3.route-tables
	src_cidrs = local.vpcs.ap-southeast-3.vpc-cidrs
  src_region = local.vpcs.ap-southeast-3.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.us_west_2
  }
}

module "peer-ap-southeast-4-ca-central-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.ca-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.ca-central-1.vpc-id
	dest_route_tables =  local.vpcs.ca-central-1.route-tables
	dest_cidrs = local.vpcs.ca-central-1.vpc-cidrs
	dest_region = local.vpcs.ca-central-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.ca_central_1
  }
}

module "peer-ap-southeast-4-eu-central-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_central_1
  }
}

module "peer-ap-southeast-4-eu-central-2" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_central_2
  }
}

module "peer-ap-southeast-4-eu-north-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_north_1
  }
}

module "peer-ap-southeast-4-eu-south-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_south_1
  }
}

module "peer-ap-southeast-4-eu-south-2" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_south_2
  }
}

module "peer-ap-southeast-4-eu-west-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_west_1
  }
}

module "peer-ap-southeast-4-eu-west-2" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_west_2
  }
}

module "peer-ap-southeast-4-eu-west-3" {
  count = (local.enabled.ap-southeast-4 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.eu_west_3
  }
}

module "peer-ap-southeast-4-me-central-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.me_central_1
  }
}

module "peer-ap-southeast-4-me-south-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.me_south_1
  }
}

module "peer-ap-southeast-4-sa-east-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.sa_east_1
  }
}

module "peer-ap-southeast-4-us-east-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.us_east_1
  }
}

module "peer-ap-southeast-4-us-east-2" {
  count = (local.enabled.ap-southeast-4 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.us_east_2
  }
}

module "peer-ap-southeast-4-us-west-1" {
  count = (local.enabled.ap-southeast-4 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.us_west_1
  }
}

module "peer-ap-southeast-4-us-west-2" {
  count = (local.enabled.ap-southeast-4 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ap-southeast-4.vpc-id
	src_route_tables =  local.vpcs.ap-southeast-4.route-tables
	src_cidrs = local.vpcs.ap-southeast-4.vpc-cidrs
  src_region = local.vpcs.ap-southeast-4.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ap_southeast_4
    aws.dest = aws.us_west_2
  }
}

module "peer-ca-central-1-eu-central-1" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-central-1.vpc-id
	dest_route_tables =  local.vpcs.eu-central-1.route-tables
	dest_cidrs = local.vpcs.eu-central-1.vpc-cidrs
	dest_region = local.vpcs.eu-central-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_central_1
  }
}

module "peer-ca-central-1-eu-central-2" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-ca-central-1-eu-north-1" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-ca-central-1-eu-south-1" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-ca-central-1-eu-south-2" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-ca-central-1-eu-west-1" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-ca-central-1-eu-west-2" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-ca-central-1-eu-west-3" {
  count = (local.enabled.ca-central-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-ca-central-1-me-central-1" {
  count = (local.enabled.ca-central-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.me_central_1
  }
}

module "peer-ca-central-1-me-south-1" {
  count = (local.enabled.ca-central-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.me_south_1
  }
}

module "peer-ca-central-1-sa-east-1" {
  count = (local.enabled.ca-central-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-ca-central-1-us-east-1" {
  count = (local.enabled.ca-central-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.us_east_1
  }
}

module "peer-ca-central-1-us-east-2" {
  count = (local.enabled.ca-central-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.us_east_2
  }
}

module "peer-ca-central-1-us-west-1" {
  count = (local.enabled.ca-central-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.us_west_1
  }
}

module "peer-ca-central-1-us-west-2" {
  count = (local.enabled.ca-central-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.ca-central-1.vpc-id
	src_route_tables =  local.vpcs.ca-central-1.route-tables
	src_cidrs = local.vpcs.ca-central-1.vpc-cidrs
  src_region = local.vpcs.ca-central-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-central-1-eu-central-2" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-central-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-central-2.vpc-id
	dest_route_tables =  local.vpcs.eu-central-2.route-tables
	dest_cidrs = local.vpcs.eu-central-2.vpc-cidrs
	dest_region = local.vpcs.eu-central-2.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_central_2
  }
}

module "peer-eu-central-1-eu-north-1" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_north_1
  }
}

module "peer-eu-central-1-eu-south-1" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-eu-central-1-eu-south-2" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-eu-central-1-eu-west-1" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-eu-central-1-eu-west-2" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-central-1-eu-west-3" {
  count = (local.enabled.eu-central-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-central-1-me-central-1" {
  count = (local.enabled.eu-central-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-central-1-me-south-1" {
  count = (local.enabled.eu-central-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-central-1-sa-east-1" {
  count = (local.enabled.eu-central-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-central-1-us-east-1" {
  count = (local.enabled.eu-central-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-central-1-us-east-2" {
  count = (local.enabled.eu-central-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-central-1-us-west-1" {
  count = (local.enabled.eu-central-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-central-1-us-west-2" {
  count = (local.enabled.eu-central-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-1.vpc-id
	src_route_tables =  local.vpcs.eu-central-1.route-tables
	src_cidrs = local.vpcs.eu-central-1.vpc-cidrs
  src_region = local.vpcs.eu-central-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_central_1
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-central-2-eu-north-1" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-north-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-north-1.vpc-id
	dest_route_tables =  local.vpcs.eu-north-1.route-tables
	dest_cidrs = local.vpcs.eu-north-1.vpc-cidrs
	dest_region = local.vpcs.eu-north-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_north_1
  }
}

module "peer-eu-central-2-eu-south-1" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_south_1
  }
}

module "peer-eu-central-2-eu-south-2" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_south_2
  }
}

module "peer-eu-central-2-eu-west-1" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_west_1
  }
}

module "peer-eu-central-2-eu-west-2" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-central-2-eu-west-3" {
  count = (local.enabled.eu-central-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-central-2-me-central-1" {
  count = (local.enabled.eu-central-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-central-2-me-south-1" {
  count = (local.enabled.eu-central-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-central-2-sa-east-1" {
  count = (local.enabled.eu-central-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-central-2-us-east-1" {
  count = (local.enabled.eu-central-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-central-2-us-east-2" {
  count = (local.enabled.eu-central-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-central-2-us-west-1" {
  count = (local.enabled.eu-central-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-central-2-us-west-2" {
  count = (local.enabled.eu-central-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-central-2.vpc-id
	src_route_tables =  local.vpcs.eu-central-2.route-tables
	src_cidrs = local.vpcs.eu-central-2.vpc-cidrs
  src_region = local.vpcs.eu-central-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_central_2
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-north-1-eu-south-1" {
  count = (local.enabled.eu-north-1 && local.enabled.eu-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.eu-south-1.vpc-id
	dest_route_tables =  local.vpcs.eu-south-1.route-tables
	dest_cidrs = local.vpcs.eu-south-1.vpc-cidrs
	dest_region = local.vpcs.eu-south-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_south_1
  }
}

module "peer-eu-north-1-eu-south-2" {
  count = (local.enabled.eu-north-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-eu-north-1-eu-west-1" {
  count = (local.enabled.eu-north-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-eu-north-1-eu-west-2" {
  count = (local.enabled.eu-north-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-north-1-eu-west-3" {
  count = (local.enabled.eu-north-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-north-1-me-central-1" {
  count = (local.enabled.eu-north-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-north-1-me-south-1" {
  count = (local.enabled.eu-north-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-north-1-sa-east-1" {
  count = (local.enabled.eu-north-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-north-1-us-east-1" {
  count = (local.enabled.eu-north-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-north-1-us-east-2" {
  count = (local.enabled.eu-north-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-north-1-us-west-1" {
  count = (local.enabled.eu-north-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-north-1-us-west-2" {
  count = (local.enabled.eu-north-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-north-1.vpc-id
	src_route_tables =  local.vpcs.eu-north-1.route-tables
	src_cidrs = local.vpcs.eu-north-1.vpc-cidrs
  src_region = local.vpcs.eu-north-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-south-1-eu-south-2" {
  count = (local.enabled.eu-south-1 && local.enabled.eu-south-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.eu-south-2.vpc-id
	dest_route_tables =  local.vpcs.eu-south-2.route-tables
	dest_cidrs = local.vpcs.eu-south-2.vpc-cidrs
	dest_region = local.vpcs.eu-south-2.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_south_2
  }
}

module "peer-eu-south-1-eu-west-1" {
  count = (local.enabled.eu-south-1 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_1
  }
}

module "peer-eu-south-1-eu-west-2" {
  count = (local.enabled.eu-south-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-south-1-eu-west-3" {
  count = (local.enabled.eu-south-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-south-1-me-central-1" {
  count = (local.enabled.eu-south-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-south-1-me-south-1" {
  count = (local.enabled.eu-south-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-south-1-sa-east-1" {
  count = (local.enabled.eu-south-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-south-1-us-east-1" {
  count = (local.enabled.eu-south-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-south-1-us-east-2" {
  count = (local.enabled.eu-south-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-south-1-us-west-1" {
  count = (local.enabled.eu-south-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-south-1-us-west-2" {
  count = (local.enabled.eu-south-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-1.vpc-id
	src_route_tables =  local.vpcs.eu-south-1.route-tables
	src_cidrs = local.vpcs.eu-south-1.vpc-cidrs
  src_region = local.vpcs.eu-south-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-south-2-eu-west-1" {
  count = (local.enabled.eu-south-2 && local.enabled.eu-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.eu-west-1.vpc-id
	dest_route_tables =  local.vpcs.eu-west-1.route-tables
	dest_cidrs = local.vpcs.eu-west-1.vpc-cidrs
	dest_region = local.vpcs.eu-west-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.eu_west_1
  }
}

module "peer-eu-south-2-eu-west-2" {
  count = (local.enabled.eu-south-2 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-south-2-eu-west-3" {
  count = (local.enabled.eu-south-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-south-2-me-central-1" {
  count = (local.enabled.eu-south-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-south-2-me-south-1" {
  count = (local.enabled.eu-south-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-south-2-sa-east-1" {
  count = (local.enabled.eu-south-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-south-2-us-east-1" {
  count = (local.enabled.eu-south-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-south-2-us-east-2" {
  count = (local.enabled.eu-south-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-south-2-us-west-1" {
  count = (local.enabled.eu-south-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-south-2-us-west-2" {
  count = (local.enabled.eu-south-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-south-2.vpc-id
	src_route_tables =  local.vpcs.eu-south-2.route-tables
	src_cidrs = local.vpcs.eu-south-2.vpc-cidrs
  src_region = local.vpcs.eu-south-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_south_2
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-west-1-eu-west-2" {
  count = (local.enabled.eu-west-1 && local.enabled.eu-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.eu-west-2.vpc-id
	dest_route_tables =  local.vpcs.eu-west-2.route-tables
	dest_cidrs = local.vpcs.eu-west-2.vpc-cidrs
	dest_region = local.vpcs.eu-west-2.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.eu_west_2
  }
}

module "peer-eu-west-1-eu-west-3" {
  count = (local.enabled.eu-west-1 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-west-1-me-central-1" {
  count = (local.enabled.eu-west-1 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-west-1-me-south-1" {
  count = (local.enabled.eu-west-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-west-1-sa-east-1" {
  count = (local.enabled.eu-west-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-west-1-us-east-1" {
  count = (local.enabled.eu-west-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-west-1-us-east-2" {
  count = (local.enabled.eu-west-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-west-1-us-west-1" {
  count = (local.enabled.eu-west-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-west-1-us-west-2" {
  count = (local.enabled.eu-west-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-1.vpc-id
	src_route_tables =  local.vpcs.eu-west-1.route-tables
	src_cidrs = local.vpcs.eu-west-1.vpc-cidrs
  src_region = local.vpcs.eu-west-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-west-2-eu-west-3" {
  count = (local.enabled.eu-west-2 && local.enabled.eu-west-3) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.eu-west-3.vpc-id
	dest_route_tables =  local.vpcs.eu-west-3.route-tables
	dest_cidrs = local.vpcs.eu-west-3.vpc-cidrs
	dest_region = local.vpcs.eu-west-3.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.eu_west_3
  }
}

module "peer-eu-west-2-me-central-1" {
  count = (local.enabled.eu-west-2 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-west-2-me-south-1" {
  count = (local.enabled.eu-west-2 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-west-2-sa-east-1" {
  count = (local.enabled.eu-west-2 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-west-2-us-east-1" {
  count = (local.enabled.eu-west-2 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-west-2-us-east-2" {
  count = (local.enabled.eu-west-2 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-west-2-us-west-1" {
  count = (local.enabled.eu-west-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-west-2-us-west-2" {
  count = (local.enabled.eu-west-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-2.vpc-id
	src_route_tables =  local.vpcs.eu-west-2.route-tables
	src_cidrs = local.vpcs.eu-west-2.vpc-cidrs
  src_region = local.vpcs.eu-west-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.us_west_2
  }
}

module "peer-eu-west-3-me-central-1" {
  count = (local.enabled.eu-west-3 && local.enabled.me-central-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.me-central-1.vpc-id
	dest_route_tables =  local.vpcs.me-central-1.route-tables
	dest_cidrs = local.vpcs.me-central-1.vpc-cidrs
	dest_region = local.vpcs.me-central-1.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.me_central_1
  }
}

module "peer-eu-west-3-me-south-1" {
  count = (local.enabled.eu-west-3 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.me_south_1
  }
}

module "peer-eu-west-3-sa-east-1" {
  count = (local.enabled.eu-west-3 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.sa_east_1
  }
}

module "peer-eu-west-3-us-east-1" {
  count = (local.enabled.eu-west-3 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.us_east_1
  }
}

module "peer-eu-west-3-us-east-2" {
  count = (local.enabled.eu-west-3 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.us_east_2
  }
}

module "peer-eu-west-3-us-west-1" {
  count = (local.enabled.eu-west-3 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.us_west_1
  }
}

module "peer-eu-west-3-us-west-2" {
  count = (local.enabled.eu-west-3 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.eu-west-3.vpc-id
	src_route_tables =  local.vpcs.eu-west-3.route-tables
	src_cidrs = local.vpcs.eu-west-3.vpc-cidrs
  src_region = local.vpcs.eu-west-3.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.us_west_2
  }
}

module "peer-me-central-1-me-south-1" {
  count = (local.enabled.me-central-1 && local.enabled.me-south-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.me-south-1.vpc-id
	dest_route_tables =  local.vpcs.me-south-1.route-tables
	dest_cidrs = local.vpcs.me-south-1.vpc-cidrs
	dest_region = local.vpcs.me-south-1.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.me_south_1
  }
}

module "peer-me-central-1-sa-east-1" {
  count = (local.enabled.me-central-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-me-central-1-us-east-1" {
  count = (local.enabled.me-central-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.us_east_1
  }
}

module "peer-me-central-1-us-east-2" {
  count = (local.enabled.me-central-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.us_east_2
  }
}

module "peer-me-central-1-us-west-1" {
  count = (local.enabled.me-central-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.us_west_1
  }
}

module "peer-me-central-1-us-west-2" {
  count = (local.enabled.me-central-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-central-1.vpc-id
	src_route_tables =  local.vpcs.me-central-1.route-tables
	src_cidrs = local.vpcs.me-central-1.vpc-cidrs
  src_region = local.vpcs.me-central-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.me_central_1
    aws.dest = aws.us_west_2
  }
}

module "peer-me-south-1-sa-east-1" {
  count = (local.enabled.me-south-1 && local.enabled.sa-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-south-1.vpc-id
	src_route_tables =  local.vpcs.me-south-1.route-tables
	src_cidrs = local.vpcs.me-south-1.vpc-cidrs
  src_region = local.vpcs.me-south-1.region

  dest_vpc_id = local.vpcs.sa-east-1.vpc-id
	dest_route_tables =  local.vpcs.sa-east-1.route-tables
	dest_cidrs = local.vpcs.sa-east-1.vpc-cidrs
	dest_region = local.vpcs.sa-east-1.region

  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.sa_east_1
  }
}

module "peer-me-south-1-us-east-1" {
  count = (local.enabled.me-south-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-south-1.vpc-id
	src_route_tables =  local.vpcs.me-south-1.route-tables
	src_cidrs = local.vpcs.me-south-1.vpc-cidrs
  src_region = local.vpcs.me-south-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.us_east_1
  }
}

module "peer-me-south-1-us-east-2" {
  count = (local.enabled.me-south-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-south-1.vpc-id
	src_route_tables =  local.vpcs.me-south-1.route-tables
	src_cidrs = local.vpcs.me-south-1.vpc-cidrs
  src_region = local.vpcs.me-south-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.us_east_2
  }
}

module "peer-me-south-1-us-west-1" {
  count = (local.enabled.me-south-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-south-1.vpc-id
	src_route_tables =  local.vpcs.me-south-1.route-tables
	src_cidrs = local.vpcs.me-south-1.vpc-cidrs
  src_region = local.vpcs.me-south-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.us_west_1
  }
}

module "peer-me-south-1-us-west-2" {
  count = (local.enabled.me-south-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.me-south-1.vpc-id
	src_route_tables =  local.vpcs.me-south-1.route-tables
	src_cidrs = local.vpcs.me-south-1.vpc-cidrs
  src_region = local.vpcs.me-south-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.us_west_2
  }
}

module "peer-sa-east-1-us-east-1" {
  count = (local.enabled.sa-east-1 && local.enabled.us-east-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.sa-east-1.vpc-id
	src_route_tables =  local.vpcs.sa-east-1.route-tables
	src_cidrs = local.vpcs.sa-east-1.vpc-cidrs
  src_region = local.vpcs.sa-east-1.region

  dest_vpc_id = local.vpcs.us-east-1.vpc-id
	dest_route_tables =  local.vpcs.us-east-1.route-tables
	dest_cidrs = local.vpcs.us-east-1.vpc-cidrs
	dest_region = local.vpcs.us-east-1.region

  providers = {
    aws.src = aws.sa_east_1
    aws.dest = aws.us_east_1
  }
}

module "peer-sa-east-1-us-east-2" {
  count = (local.enabled.sa-east-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.sa-east-1.vpc-id
	src_route_tables =  local.vpcs.sa-east-1.route-tables
	src_cidrs = local.vpcs.sa-east-1.vpc-cidrs
  src_region = local.vpcs.sa-east-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.sa_east_1
    aws.dest = aws.us_east_2
  }
}

module "peer-sa-east-1-us-west-1" {
  count = (local.enabled.sa-east-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.sa-east-1.vpc-id
	src_route_tables =  local.vpcs.sa-east-1.route-tables
	src_cidrs = local.vpcs.sa-east-1.vpc-cidrs
  src_region = local.vpcs.sa-east-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.sa_east_1
    aws.dest = aws.us_west_1
  }
}

module "peer-sa-east-1-us-west-2" {
  count = (local.enabled.sa-east-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.sa-east-1.vpc-id
	src_route_tables =  local.vpcs.sa-east-1.route-tables
	src_cidrs = local.vpcs.sa-east-1.vpc-cidrs
  src_region = local.vpcs.sa-east-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.sa_east_1
    aws.dest = aws.us_west_2
  }
}

module "peer-us-east-1-us-east-2" {
  count = (local.enabled.us-east-1 && local.enabled.us-east-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-east-1.vpc-id
	src_route_tables =  local.vpcs.us-east-1.route-tables
	src_cidrs = local.vpcs.us-east-1.vpc-cidrs
  src_region = local.vpcs.us-east-1.region

  dest_vpc_id = local.vpcs.us-east-2.vpc-id
	dest_route_tables =  local.vpcs.us-east-2.route-tables
	dest_cidrs = local.vpcs.us-east-2.vpc-cidrs
	dest_region = local.vpcs.us-east-2.region

  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_east_2
  }
}

module "peer-us-east-1-us-west-1" {
  count = (local.enabled.us-east-1 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-east-1.vpc-id
	src_route_tables =  local.vpcs.us-east-1.route-tables
	src_cidrs = local.vpcs.us-east-1.vpc-cidrs
  src_region = local.vpcs.us-east-1.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_west_1
  }
}

module "peer-us-east-1-us-west-2" {
  count = (local.enabled.us-east-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-east-1.vpc-id
	src_route_tables =  local.vpcs.us-east-1.route-tables
	src_cidrs = local.vpcs.us-east-1.vpc-cidrs
  src_region = local.vpcs.us-east-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_west_2
  }
}

module "peer-us-east-2-us-west-1" {
  count = (local.enabled.us-east-2 && local.enabled.us-west-1) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-east-2.vpc-id
	src_route_tables =  local.vpcs.us-east-2.route-tables
	src_cidrs = local.vpcs.us-east-2.vpc-cidrs
  src_region = local.vpcs.us-east-2.region

  dest_vpc_id = local.vpcs.us-west-1.vpc-id
	dest_route_tables =  local.vpcs.us-west-1.route-tables
	dest_cidrs = local.vpcs.us-west-1.vpc-cidrs
	dest_region = local.vpcs.us-west-1.region

  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.us_west_1
  }
}

module "peer-us-east-2-us-west-2" {
  count = (local.enabled.us-east-2 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-east-2.vpc-id
	src_route_tables =  local.vpcs.us-east-2.route-tables
	src_cidrs = local.vpcs.us-east-2.vpc-cidrs
  src_region = local.vpcs.us-east-2.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.us_west_2
  }
}

module "peer-us-west-1-us-west-2" {
  count = (local.enabled.us-west-1 && local.enabled.us-west-2) ? 1 : 0
  source = "./vpc-peering/"

  prefix = local.prefix

  src_vpc_id =  local.vpcs.us-west-1.vpc-id
	src_route_tables =  local.vpcs.us-west-1.route-tables
	src_cidrs = local.vpcs.us-west-1.vpc-cidrs
  src_region = local.vpcs.us-west-1.region

  dest_vpc_id = local.vpcs.us-west-2.vpc-id
	dest_route_tables =  local.vpcs.us-west-2.route-tables
	dest_cidrs = local.vpcs.us-west-2.vpc-cidrs
	dest_region = local.vpcs.us-west-2.region

  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.us_west_2
  }
}

