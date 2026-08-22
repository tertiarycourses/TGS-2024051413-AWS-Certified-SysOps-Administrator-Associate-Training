#!/usr/bin/env bash
set -euo pipefail
python3 -m json.tool health-check.json >/dev/null
python3 -m json.tool failover-records.json >/dev/null
test -s evidence/dns-before.txt
test -s evidence/dns-failover.txt
test -s evidence/cloudfront-headers.txt
grep -q 'Measured failover time' FAILOVER-REPORT.md
echo 'LAB 10 PASS'
