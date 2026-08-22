#!/usr/bin/env bash
set -euo pipefail
source_eni=${1:?source ENI}; destination=${2:?destination IP}
date -u +%FT%TZ
aws ec2 describe-network-interfaces --network-interface-ids "$source_eni"
aws ec2 describe-route-tables
aws ec2 describe-security-groups
aws ec2 describe-network-acls
echo "Destination under test: $destination"
