#!/usr/bin/env bash
set -u
aws cloudformation delete-stack --stack-name SysOps-Lab04-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 04 stack deletion requested; wait for DELETE_COMPLETE and check for retained resources.'
