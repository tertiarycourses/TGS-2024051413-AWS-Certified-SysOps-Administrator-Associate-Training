#!/usr/bin/env bash
set -u
aws ssm delete-document --name SysOps-Lab03-HealthCheck 2>/dev/null || true
aws cloudformation delete-stack --stack-name SysOps-Lab03-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 03 cleanup requested; verify stack DELETE_COMPLETE.'
