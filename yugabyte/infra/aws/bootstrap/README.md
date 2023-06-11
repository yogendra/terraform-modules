# Bootstrap

## Objective

* Create bare minimal infra for IAC based deployment within an AWS account
* Create S3 bucket for terraform states
* Create S3 bucket for assets (doc pages, json, keys, licenses, etc.)
* Put assets in asset bucket
*



## How to get started

At start there is no bucket on the AWS account to put the state files. So, start without the backend. After first apply, i.e. state bucket is created, change the backend to S3 and migrate state.


Create initial infra with local backed. Disable / comment out the backend part in the `terraform {}` block in `init.tf`

1. Set terraform backend to be local

    ```hcl
    # init.tf
    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
        }
      }
      # backend "s3" {
      #   bucket = "yb-apj-terraform-states"
      #   key    = "apj-demo/bootstrap"
      #   region = "ap-southeast-1"
      # }
    }
    ```

1. Initialize terraform env

    ```bash
    terraform init -upgrade
    ```

1. Apply terraform

    ```bash
    terraform apply
    ```


1. Uncomment backend in `init.tf`.

    ```hcl
    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
        }
      }
      backend "s3" {
        bucket = "yb-apj-terraform-states"
        key    = "apj-demo/bootstrap"
        region = "ap-southeast-1"
      }
    }
    ```

1. Re-init with migrate-state

    ```bash
    terraform init -migrate-state
    ```

1. (Optional) Check the bucket for state file

1. (Optional) Check the state file by running plan command

    ```bash
    terraform plan
    ```

    There should me no change

1. Cleanup old local state files

    ```bash
    rm *tfstate*
    ```
All set



## Todo

1. SSH Key - Generate and Add to all regions
1. MPL - Create a global MPL
1. IAM - Create instance role for jumpbox
1. Jumpbox - Create a jumpbox
