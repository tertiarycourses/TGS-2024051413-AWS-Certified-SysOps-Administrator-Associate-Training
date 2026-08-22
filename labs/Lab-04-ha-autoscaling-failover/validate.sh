#!/usr/bin/env bash
set -euo pipefail
! grep -R 'REPLACE_' FAILOVER-REPORT.md
test -s evidence/stack-outputs.txt
test -s evidence/target-health-before.txt
test -s evidence/failover-observation.txt
grep -q 'Measured recovery time' FAILOVER-REPORT.md
echo 'LAB 04 PASS'
