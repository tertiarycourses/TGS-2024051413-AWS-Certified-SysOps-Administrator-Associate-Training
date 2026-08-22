#!/usr/bin/env bash
set -u
aws cloudformation delete-stack --stack-name SysOps-Lab07-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 07 cleanup requested; verify intentional noncompliance and the stack are removed.'
