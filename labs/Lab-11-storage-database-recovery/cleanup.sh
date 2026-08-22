#!/usr/bin/env bash
set -u
aws rds delete-db-instance --db-instance-identifier sysops-lab11-restore-REPLACE_SUFFIX --skip-final-snapshot 2>/dev/null || true
aws rds delete-db-snapshot --db-snapshot-identifier sysops-lab11-REPLACE_SUFFIX 2>/dev/null || true
echo 'Lab 11 cleanup requested; verify the isolated restore and learner snapshot are deleted.'
