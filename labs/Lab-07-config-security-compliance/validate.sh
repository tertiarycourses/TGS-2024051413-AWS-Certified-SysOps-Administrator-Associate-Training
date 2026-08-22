#!/usr/bin/env bash
set -euo pipefail
python3 -m json.tool tag-policy.json >/dev/null
python3 -m json.tool sample-security-findings.json >/dev/null
test -s evidence/config-findings.json
! grep -q 'REPLACE_' REMEDIATION-REGISTER.csv
grep -q 'Expiry date' EXCEPTION-RECORD.md
echo 'LAB 07 PASS'
