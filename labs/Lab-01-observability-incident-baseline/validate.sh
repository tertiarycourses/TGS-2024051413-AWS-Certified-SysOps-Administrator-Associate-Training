#!/usr/bin/env bash
set -euo pipefail
! grep -R 'REPLACE_' cloudwatch-dashboard.json alarm.json
python3 -m json.tool cloudwatch-dashboard.json >/dev/null
python3 -m json.tool alarm.json >/dev/null
python3 -m json.tool event-pattern.json >/dev/null
test -s evidence/caller-identity.txt
test -s evidence/cloudtrail-events.txt
grep -q 'Observation' INCIDENT-EVIDENCE.md
echo 'LAB 01 PASS'
