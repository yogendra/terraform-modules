#!/usr/bin/env bash

set -e

mpl_name=${1:-shr-allow-remote}
mpl_desc=${2:-$USER [0]}
mpl_cidr=$(curl -sSL ifconfig.me)/32

aws ec2 describe-regions --all-regions  --query "Regions[*].[RegionName]" --output text  | while read region
do
  aws ec2 describe-managed-prefix-lists --region $region --filter "Name=prefix-list-name,Values=$mpl_name" --query="PrefixLists[*].[PrefixListId, Version]" --output text 2> /dev/null| while read mpl_id mpl_version
  do
    old_cidr=$(aws ec2 get-managed-prefix-list-entries --region $region --prefix-list-id=$mpl_id | jq -r ".Entries[] | select( .Description == \"$mpl_desc\") | .Cidr")
    remove_opt=""
    if [[ $old_cidr == $mpl_cidr ]]
    then
      echo "$region: Skipped, no change in CIDR"
      continue
    fi

    if [[ -n $old_cidr  ]]
    then
      aws ec2 modify-managed-prefix-list --region $region --prefix-list-id $mpl_id --add-entries "[{\"Cidr\":\"$mpl_cidr\", \"Description\":\"$mpl_desc\"}]" --current-version $mpl_version --remove-entries "[{\"Cidr\":\"$old_cidr\"}]"
    else
      aws ec2 modify-managed-prefix-list --region $region --prefix-list-id $mpl_id --add-entries "[{\"Cidr\":\"$mpl_cidr\", \"Description\":\"$mpl_desc\"}]" --current-version $mpl_version
    fi

    echo $region: MPL $mpl_id/$mpl_version updated
  done
done
