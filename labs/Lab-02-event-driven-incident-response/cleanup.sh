#!/usr/bin/env bash
set -u
aws events remove-targets --rule SysOps-Lab02-SGChange --ids Lab02Lambda 2>/dev/null || true
aws events delete-rule --name SysOps-Lab02-SGChange 2>/dev/null || true
aws lambda delete-function --function-name SysOps-Lab02-Triage-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 02 automation removed where present; verify the learner-owned security group is restored.'
