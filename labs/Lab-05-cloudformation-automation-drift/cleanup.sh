#!/usr/bin/env bash
set -u
aws ssm delete-document --name SysOps-Lab05-VerifyBucket 2>/dev/null || true
aws cloudformation delete-stack --stack-name SysOps-Lab05-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 05 cleanup requested; empty the learner bucket first if stack deletion reports a failure.'
