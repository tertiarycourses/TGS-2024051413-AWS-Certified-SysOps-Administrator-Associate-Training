#!/usr/bin/env bash
set -euo pipefail
test -s evidence/dns.txt
test -s evidence/routes.json
test -s evidence/security-group.json
test -s evidence/nacl.json
grep -q 'First failed boundary' DIAGNOSTIC-REPORT.md
echo 'LAB 09 PASS'
