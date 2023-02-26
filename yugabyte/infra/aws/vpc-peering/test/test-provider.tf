
provider "aws" {
  alias  = "ap_southeast_1"
  region = "ap-southeast-1"
  default_tags {
    tags = {
      yb_owner    = "yrampuria",
      yb_dept     = "presales",
      yb_task     = "demo",
      yb_customer = "yugabyte"
    }
  }
}

provider "aws" {
  alias  = "ap_southeast_2"
  region = "ap-southeast-2"
  default_tags {
    tags = {
      yb_owner    = "yrampuria",
      yb_dept     = "presales",
      yb_task     = "demo",
      yb_customer = "yugabyte"
    }
  }
}
