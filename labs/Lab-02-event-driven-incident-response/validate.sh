#!/usr/bin/env bash
set -euo pipefail
python3 -m json.tool event-pattern.json >/dev/null
python3 -m json.tool test-event.json >/dev/null
python3 -m json.tool lambda-role-policy.json >/dev/null
python3 -m py_compile triage.py
test -s evidence/invoke-response.json
test -s evidence/triage-log.txt
grep -q 'Authority / approval' TRIAGE-DECISION.md
echo 'LAB 02 PASS'
