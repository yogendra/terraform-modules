
module "peer-ap-northeast-3-us-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-us-east-1.vpc_id
  prefix = "asd-ap-northeast-3-us-east-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-us-east-1
  ]
}
      
module "peer-ap-northeast-3-us-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-us-west-1.vpc_id
  prefix = "asd-ap-northeast-3-us-west-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_west_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-us-west-1
  ]
}
      
module "peer-ap-northeast-3-af-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-af-south-1.vpc_id
  prefix = "asd-ap-northeast-3-af-south-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.af_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-af-south-1
  ]
}
      
module "peer-ap-northeast-3-eu-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-south-1.vpc_id
  prefix = "asd-ap-northeast-3-eu-south-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-south-1
  ]
}
      
module "peer-ap-northeast-3-ap-south-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-south-2.vpc_id
  prefix = "asd-ap-northeast-3-ap-south-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_south_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-south-2
  ]
}
      
module "peer-ap-northeast-3-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-ap-northeast-3-us-west-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-us-west-2
  ]
}
      
module "peer-ap-northeast-3-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-ap-northeast-3-ap-northeast-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-ap-northeast-3-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-ap-northeast-3-eu-west-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-west-2
  ]
}
      
module "peer-ap-northeast-3-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-ap-northeast-3-ap-southeast-3"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-ap-northeast-3-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-ap-northeast-3-ca-central-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ca-central-1
  ]
}
      
module "peer-ap-northeast-3-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-ap-northeast-3-ap-southeast-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-ap-northeast-3-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ap-northeast-3-me-south-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-me-south-1
  ]
}
      
module "peer-ap-northeast-3-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ap-northeast-3-us-east-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-us-east-2
  ]
}
      
module "peer-ap-northeast-3-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ap-northeast-3-ap-south-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ap-northeast-3-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-northeast-3-ap-northeast-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-northeast-3-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-northeast-3-eu-west-3"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-northeast-3-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-northeast-3-ap-southeast-2"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-northeast-3-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-northeast-3-eu-west-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-northeast-3-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-northeast-3-ap-east-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-northeast-3-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-northeast-3-eu-north-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-northeast-3-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-northeast-3-sa-east-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-northeast-3-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-northeast-3-eu-central-1"
  providers = {
    aws.src = aws.ap_northeast_3
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-northeast-3,
    module.vpc-eu-central-1
  ]
}
      
module "peer-us-east-1-us-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-us-west-1.vpc_id
  prefix = "asd-us-east-1-us-west-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_west_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-us-west-1
  ]
}
      
module "peer-us-east-1-af-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-af-south-1.vpc_id
  prefix = "asd-us-east-1-af-south-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.af_south_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-af-south-1
  ]
}
      
module "peer-us-east-1-eu-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-south-1.vpc_id
  prefix = "asd-us-east-1-eu-south-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_south_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-south-1
  ]
}
      
module "peer-us-east-1-ap-south-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-2.vpc_id
  prefix = "asd-us-east-1-ap-south-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_south_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-south-2
  ]
}
      
module "peer-us-east-1-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-us-east-1-us-west-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-us-west-2
  ]
}
      
module "peer-us-east-1-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-us-east-1-ap-northeast-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-us-east-1-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-us-east-1-eu-west-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-west-2
  ]
}
      
module "peer-us-east-1-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-us-east-1-ap-southeast-3"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-us-east-1-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-us-east-1-ca-central-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ca-central-1
  ]
}
      
module "peer-us-east-1-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-us-east-1-ap-southeast-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-us-east-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-us-east-1-me-south-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-us-east-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-us-east-1-us-east-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-us-east-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-us-east-1-ap-south-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-us-east-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-us-east-1-ap-northeast-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-us-east-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-us-east-1-eu-west-3"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-us-east-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-us-east-1-ap-southeast-2"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-us-east-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-us-east-1-eu-west-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-us-east-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-us-east-1-ap-east-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-us-east-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-us-east-1-eu-north-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-us-east-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-us-east-1-sa-east-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-us-east-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-us-east-1-eu-central-1"
  providers = {
    aws.src = aws.us_east_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-us-east-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-us-west-1-af-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-af-south-1.vpc_id
  prefix = "asd-us-west-1-af-south-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.af_south_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-af-south-1
  ]
}
      
module "peer-us-west-1-eu-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-south-1.vpc_id
  prefix = "asd-us-west-1-eu-south-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_south_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-south-1
  ]
}
      
module "peer-us-west-1-ap-south-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-2.vpc_id
  prefix = "asd-us-west-1-ap-south-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_south_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-south-2
  ]
}
      
module "peer-us-west-1-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-us-west-1-us-west-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-us-west-2
  ]
}
      
module "peer-us-west-1-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-us-west-1-ap-northeast-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-us-west-1-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-us-west-1-eu-west-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-west-2
  ]
}
      
module "peer-us-west-1-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-us-west-1-ap-southeast-3"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-us-west-1-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-us-west-1-ca-central-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ca-central-1
  ]
}
      
module "peer-us-west-1-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-us-west-1-ap-southeast-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-us-west-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-us-west-1-me-south-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-us-west-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-us-west-1-us-east-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-us-west-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-us-west-1-ap-south-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-us-west-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-us-west-1-ap-northeast-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-us-west-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-us-west-1-eu-west-3"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-us-west-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-us-west-1-ap-southeast-2"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-us-west-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-us-west-1-eu-west-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-us-west-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-us-west-1-ap-east-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-us-west-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-us-west-1-eu-north-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-us-west-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-us-west-1-sa-east-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-us-west-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-us-west-1-eu-central-1"
  providers = {
    aws.src = aws.us_west_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-us-west-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-af-south-1-eu-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-south-1.vpc_id
  prefix = "asd-af-south-1-eu-south-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_south_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-south-1
  ]
}
      
module "peer-af-south-1-ap-south-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-2.vpc_id
  prefix = "asd-af-south-1-ap-south-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_south_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-south-2
  ]
}
      
module "peer-af-south-1-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-af-south-1-us-west-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-us-west-2
  ]
}
      
module "peer-af-south-1-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-af-south-1-ap-northeast-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-af-south-1-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-af-south-1-eu-west-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-west-2
  ]
}
      
module "peer-af-south-1-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-af-south-1-ap-southeast-3"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-af-south-1-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-af-south-1-ca-central-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ca-central-1
  ]
}
      
module "peer-af-south-1-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-af-south-1-ap-southeast-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-af-south-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-af-south-1-me-south-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-af-south-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-af-south-1-us-east-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-af-south-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-af-south-1-ap-south-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-af-south-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-af-south-1-ap-northeast-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-af-south-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-af-south-1-eu-west-3"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-af-south-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-af-south-1-ap-southeast-2"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-af-south-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-af-south-1-eu-west-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-af-south-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-af-south-1-ap-east-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-af-south-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-af-south-1-eu-north-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-af-south-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-af-south-1-sa-east-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-af-south-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-af-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-af-south-1-eu-central-1"
  providers = {
    aws.src = aws.af_south_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-af-south-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-eu-south-1-ap-south-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-2.vpc_id
  prefix = "asd-eu-south-1-ap-south-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_south_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-south-2
  ]
}
      
module "peer-eu-south-1-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-eu-south-1-us-west-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-us-west-2
  ]
}
      
module "peer-eu-south-1-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-eu-south-1-ap-northeast-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-eu-south-1-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-eu-south-1-eu-west-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-eu-west-2
  ]
}
      
module "peer-eu-south-1-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-eu-south-1-ap-southeast-3"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-eu-south-1-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-eu-south-1-ca-central-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ca-central-1
  ]
}
      
module "peer-eu-south-1-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-eu-south-1-ap-southeast-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-eu-south-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-eu-south-1-me-south-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-eu-south-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-eu-south-1-us-east-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-eu-south-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-eu-south-1-ap-south-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-eu-south-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-eu-south-1-ap-northeast-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-eu-south-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-eu-south-1-eu-west-3"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-eu-south-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-eu-south-1-ap-southeast-2"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-eu-south-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-eu-south-1-eu-west-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-eu-south-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-eu-south-1-ap-east-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-eu-south-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-eu-south-1-eu-north-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-eu-south-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-eu-south-1-sa-east-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-eu-south-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-eu-south-1-eu-central-1"
  providers = {
    aws.src = aws.eu_south_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-eu-south-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-south-2-us-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-us-west-2.vpc_id
  prefix = "asd-ap-south-2-us-west-2"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_west_2
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-us-west-2
  ]
}
      
module "peer-ap-south-2-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-ap-south-2-ap-northeast-2"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-ap-south-2-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-ap-south-2-eu-west-2"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-eu-west-2
  ]
}
      
module "peer-ap-south-2-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-ap-south-2-ap-southeast-3"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-ap-south-2-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-ap-south-2-ca-central-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ca-central-1
  ]
}
      
module "peer-ap-south-2-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-ap-south-2-ap-southeast-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-ap-south-2-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ap-south-2-me-south-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-me-south-1
  ]
}
      
module "peer-ap-south-2-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ap-south-2-us-east-2"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-us-east-2
  ]
}
      
module "peer-ap-south-2-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ap-south-2-ap-south-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ap-south-2-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-south-2-ap-northeast-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-south-2-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-south-2-eu-west-3"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-south-2-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-south-2-ap-southeast-2"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-south-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-south-2-eu-west-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-south-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-south-2-ap-east-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-south-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-south-2-eu-north-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-south-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-south-2-sa-east-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-south-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-south-2-eu-central-1"
  providers = {
    aws.src = aws.ap_south_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-south-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-us-west-2-ap-northeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-2.vpc_id
  prefix = "asd-us-west-2-ap-northeast-2"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_northeast_2
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-northeast-2
  ]
}
      
module "peer-us-west-2-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-us-west-2-eu-west-2"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-eu-west-2
  ]
}
      
module "peer-us-west-2-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-us-west-2-ap-southeast-3"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-us-west-2-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-us-west-2-ca-central-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ca-central-1
  ]
}
      
module "peer-us-west-2-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-us-west-2-ap-southeast-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-us-west-2-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-us-west-2-me-south-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-me-south-1
  ]
}
      
module "peer-us-west-2-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-us-west-2-us-east-2"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-us-east-2
  ]
}
      
module "peer-us-west-2-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-us-west-2-ap-south-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-south-1
  ]
}
      
module "peer-us-west-2-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-us-west-2-ap-northeast-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-us-west-2-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-us-west-2-eu-west-3"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-eu-west-3
  ]
}
      
module "peer-us-west-2-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-us-west-2-ap-southeast-2"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-us-west-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-us-west-2-eu-west-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-us-west-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-us-west-2-ap-east-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-us-west-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-us-west-2-eu-north-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-us-west-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-us-west-2-sa-east-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-us-west-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-us-west-2-eu-central-1"
  providers = {
    aws.src = aws.us_west_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-us-west-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-northeast-2-eu-west-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-2.vpc_id
  prefix = "asd-ap-northeast-2-eu-west-2"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_2
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-eu-west-2
  ]
}
      
module "peer-ap-northeast-2-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-ap-northeast-2-ap-southeast-3"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-ap-northeast-2-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-ap-northeast-2-ca-central-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ca-central-1
  ]
}
      
module "peer-ap-northeast-2-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-ap-northeast-2-ap-southeast-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-ap-northeast-2-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ap-northeast-2-me-south-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-me-south-1
  ]
}
      
module "peer-ap-northeast-2-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ap-northeast-2-us-east-2"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-us-east-2
  ]
}
      
module "peer-ap-northeast-2-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ap-northeast-2-ap-south-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ap-northeast-2-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-northeast-2-ap-northeast-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-northeast-2-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-northeast-2-eu-west-3"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-northeast-2-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-northeast-2-ap-southeast-2"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-northeast-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-northeast-2-eu-west-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-northeast-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-northeast-2-ap-east-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-northeast-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-northeast-2-eu-north-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-northeast-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-northeast-2-sa-east-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-northeast-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-northeast-2-eu-central-1"
  providers = {
    aws.src = aws.ap_northeast_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-northeast-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-eu-west-2-ap-southeast-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-3.vpc_id
  prefix = "asd-eu-west-2-ap-southeast-3"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_southeast_3
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-southeast-3
  ]
}
      
module "peer-eu-west-2-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-eu-west-2-ca-central-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ca-central-1
  ]
}
      
module "peer-eu-west-2-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-eu-west-2-ap-southeast-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-eu-west-2-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-eu-west-2-me-south-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-me-south-1
  ]
}
      
module "peer-eu-west-2-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-eu-west-2-us-east-2"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-us-east-2
  ]
}
      
module "peer-eu-west-2-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-eu-west-2-ap-south-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-south-1
  ]
}
      
module "peer-eu-west-2-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-eu-west-2-ap-northeast-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-eu-west-2-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-eu-west-2-eu-west-3"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-eu-west-3
  ]
}
      
module "peer-eu-west-2-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-eu-west-2-ap-southeast-2"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-eu-west-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-eu-west-2-eu-west-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-eu-west-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-eu-west-2-ap-east-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-eu-west-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-eu-west-2-eu-north-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-eu-west-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-eu-west-2-sa-east-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-eu-west-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-eu-west-2-eu-central-1"
  providers = {
    aws.src = aws.eu_west_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-eu-west-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-southeast-3-ca-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ca-central-1.vpc_id
  prefix = "asd-ap-southeast-3-ca-central-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ca_central_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ca-central-1
  ]
}
      
module "peer-ap-southeast-3-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-ap-southeast-3-ap-southeast-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-ap-southeast-3-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ap-southeast-3-me-south-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-me-south-1
  ]
}
      
module "peer-ap-southeast-3-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ap-southeast-3-us-east-2"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-us-east-2
  ]
}
      
module "peer-ap-southeast-3-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ap-southeast-3-ap-south-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ap-southeast-3-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-southeast-3-ap-northeast-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-southeast-3-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-southeast-3-eu-west-3"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-southeast-3-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-southeast-3-ap-southeast-2"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-southeast-3-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-southeast-3-eu-west-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-southeast-3-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-southeast-3-ap-east-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-southeast-3-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-southeast-3-eu-north-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-southeast-3-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-southeast-3-sa-east-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-southeast-3-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-3.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-southeast-3-eu-central-1"
  providers = {
    aws.src = aws.ap_southeast_3
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-southeast-3,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ca-central-1-ap-southeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-1.vpc_id
  prefix = "asd-ca-central-1-ap-southeast-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.ap_southeast_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-ap-southeast-1
  ]
}
      
module "peer-ca-central-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ca-central-1-me-south-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-ca-central-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ca-central-1-us-east-2"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-ca-central-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ca-central-1-ap-south-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ca-central-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ca-central-1-ap-northeast-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ca-central-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ca-central-1-eu-west-3"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ca-central-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ca-central-1-ap-southeast-2"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ca-central-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ca-central-1-eu-west-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ca-central-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ca-central-1-ap-east-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ca-central-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ca-central-1-eu-north-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ca-central-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ca-central-1-sa-east-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ca-central-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ca-central-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ca-central-1-eu-central-1"
  providers = {
    aws.src = aws.ca_central_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ca-central-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-southeast-1-me-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-me-south-1.vpc_id
  prefix = "asd-ap-southeast-1-me-south-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.me_south_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-me-south-1
  ]
}
      
module "peer-ap-southeast-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-ap-southeast-1-us-east-2"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-ap-southeast-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-ap-southeast-1-ap-south-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-ap-southeast-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-southeast-1-ap-northeast-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-southeast-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-southeast-1-eu-west-3"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-southeast-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-southeast-1-ap-southeast-2"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-southeast-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-southeast-1-eu-west-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-southeast-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-southeast-1-ap-east-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-southeast-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-southeast-1-eu-north-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-southeast-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-southeast-1-sa-east-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-southeast-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-southeast-1-eu-central-1"
  providers = {
    aws.src = aws.ap_southeast_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-southeast-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-me-south-1-us-east-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-us-east-2.vpc_id
  prefix = "asd-me-south-1-us-east-2"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.us_east_2
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-us-east-2
  ]
}
      
module "peer-me-south-1-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-me-south-1-ap-south-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-ap-south-1
  ]
}
      
module "peer-me-south-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-me-south-1-ap-northeast-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-me-south-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-me-south-1-eu-west-3"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-me-south-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-me-south-1-ap-southeast-2"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-me-south-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-me-south-1-eu-west-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-me-south-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-me-south-1-ap-east-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-me-south-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-me-south-1-eu-north-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-me-south-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-me-south-1-sa-east-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-me-south-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-me-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-me-south-1-eu-central-1"
  providers = {
    aws.src = aws.me_south_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-me-south-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-us-east-2-ap-south-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-ap-south-1.vpc_id
  prefix = "asd-us-east-2-ap-south-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.ap_south_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-ap-south-1
  ]
}
      
module "peer-us-east-2-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-us-east-2-ap-northeast-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-us-east-2-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-us-east-2-eu-west-3"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-eu-west-3
  ]
}
      
module "peer-us-east-2-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-us-east-2-ap-southeast-2"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-us-east-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-us-east-2-eu-west-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-us-east-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-us-east-2-ap-east-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-us-east-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-us-east-2-eu-north-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-us-east-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-us-east-2-sa-east-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-us-east-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-us-east-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-us-east-2-eu-central-1"
  providers = {
    aws.src = aws.us_east_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-us-east-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-south-1-ap-northeast-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-northeast-1.vpc_id
  prefix = "asd-ap-south-1-ap-northeast-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_northeast_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-ap-northeast-1
  ]
}
      
module "peer-ap-south-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-south-1-eu-west-3"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-south-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-south-1-ap-southeast-2"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-south-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-south-1-eu-west-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-south-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-south-1-ap-east-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-south-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-south-1-eu-north-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-south-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-south-1-sa-east-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-south-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-south-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-south-1-eu-central-1"
  providers = {
    aws.src = aws.ap_south_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-south-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-northeast-1-eu-west-3" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-3.vpc_id
  prefix = "asd-ap-northeast-1-eu-west-3"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_west_3
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-eu-west-3
  ]
}
      
module "peer-ap-northeast-1-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-ap-northeast-1-ap-southeast-2"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-ap-northeast-1-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-northeast-1-eu-west-1"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-northeast-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-northeast-1-ap-east-1"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-northeast-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-northeast-1-eu-north-1"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-northeast-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-northeast-1-sa-east-1"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-northeast-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-northeast-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-northeast-1-eu-central-1"
  providers = {
    aws.src = aws.ap_northeast_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-northeast-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-eu-west-3-ap-southeast-2" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-ap-southeast-2.vpc_id
  prefix = "asd-eu-west-3-ap-southeast-2"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.ap_southeast_2
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-ap-southeast-2
  ]
}
      
module "peer-eu-west-3-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-eu-west-3-eu-west-1"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-eu-west-1
  ]
}
      
module "peer-eu-west-3-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-eu-west-3-ap-east-1"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-ap-east-1
  ]
}
      
module "peer-eu-west-3-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-eu-west-3-eu-north-1"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-eu-north-1
  ]
}
      
module "peer-eu-west-3-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-eu-west-3-sa-east-1"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-sa-east-1
  ]
}
      
module "peer-eu-west-3-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-3.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-eu-west-3-eu-central-1"
  providers = {
    aws.src = aws.eu_west_3
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-eu-west-3,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-southeast-2-eu-west-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-west-1.vpc_id
  prefix = "asd-ap-southeast-2-eu-west-1"
  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_west_1
  }
  depends_on = [
    module.vpc-ap-southeast-2,
    module.vpc-eu-west-1
  ]
}
      
module "peer-ap-southeast-2-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-2.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-ap-southeast-2-ap-east-1"
  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-2,
    module.vpc-ap-east-1
  ]
}
      
module "peer-ap-southeast-2-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-southeast-2-eu-north-1"
  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-southeast-2,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-southeast-2-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-2.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-southeast-2-sa-east-1"
  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-southeast-2,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-southeast-2-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-southeast-2.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-southeast-2-eu-central-1"
  providers = {
    aws.src = aws.ap_southeast_2
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-southeast-2,
    module.vpc-eu-central-1
  ]
}
      
module "peer-eu-west-1-ap-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-1.vpc_id
  dest_vpc_id = module.vpc-ap-east-1.vpc_id
  prefix = "asd-eu-west-1-ap-east-1"
  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.ap_east_1
  }
  depends_on = [
    module.vpc-eu-west-1,
    module.vpc-ap-east-1
  ]
}
      
module "peer-eu-west-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-eu-west-1-eu-north-1"
  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-eu-west-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-eu-west-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-eu-west-1-sa-east-1"
  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-eu-west-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-eu-west-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-west-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-eu-west-1-eu-central-1"
  providers = {
    aws.src = aws.eu_west_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-eu-west-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-ap-east-1-eu-north-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-north-1.vpc_id
  prefix = "asd-ap-east-1-eu-north-1"
  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_north_1
  }
  depends_on = [
    module.vpc-ap-east-1,
    module.vpc-eu-north-1
  ]
}
      
module "peer-ap-east-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-east-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-ap-east-1-sa-east-1"
  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-ap-east-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-ap-east-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-ap-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-ap-east-1-eu-central-1"
  providers = {
    aws.src = aws.ap_east_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-ap-east-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-eu-north-1-sa-east-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-north-1.vpc_id
  dest_vpc_id = module.vpc-sa-east-1.vpc_id
  prefix = "asd-eu-north-1-sa-east-1"
  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.sa_east_1
  }
  depends_on = [
    module.vpc-eu-north-1,
    module.vpc-sa-east-1
  ]
}
      
module "peer-eu-north-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-eu-north-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-eu-north-1-eu-central-1"
  providers = {
    aws.src = aws.eu_north_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-eu-north-1,
    module.vpc-eu-central-1
  ]
}
      
module "peer-sa-east-1-eu-central-1" {
  source = "../modules/yb-vpc-peering"
  src_vpc_id =  module.vpc-sa-east-1.vpc_id
  dest_vpc_id = module.vpc-eu-central-1.vpc_id
  prefix = "asd-sa-east-1-eu-central-1"
  providers = {
    aws.src = aws.sa_east_1
    aws.dest = aws.eu_central_1
  }
  depends_on = [
    module.vpc-sa-east-1,
    module.vpc-eu-central-1
  ]
}
      
