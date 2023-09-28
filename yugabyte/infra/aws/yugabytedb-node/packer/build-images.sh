packer build --var 'yb-version=2.18.1.0' --var "arch=arm64" ybdb-aws.pkr.hcl
packer build --var 'yb-version=2.18.1.0' --var "arch=x86_64" ybdb-aws.pkr.hcl


packer build --var 'yb-version=2.18.2.1' --var "arch=arm64" ybdb-aws.pkr.hcl
packer build --var 'yb-version=2.18.2.1' --var "arch=x86_64" ybdb-aws.pkr.hcl


packer build --var 'yb-version=2.19.0.0' --var "arch=arm64" ybdb-aws.pkr.hcl
packer build --var 'yb-version=2.18.0.0' --var "arch=x86_64" ybdb-aws.pkr.hcl
