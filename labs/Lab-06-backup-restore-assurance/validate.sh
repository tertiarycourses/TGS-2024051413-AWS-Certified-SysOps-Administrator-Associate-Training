#!/usr/bin/env bash
set -euo pipefail
python3 -m json.tool backup-plan.json >/dev/null
python3 -m json.tool backup-selection.json >/dev/null
test -s evidence/backup-job.json
test -s evidence/restore-job.json
grep -q 'Actual RTO' RECOVERY-REPORT.md
echo 'LAB 06 PASS'
