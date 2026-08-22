#!/usr/bin/env bash
set -euo pipefail
python3 build_timeline.py | grep -q 'PASS'
test -s output/timeline.csv
! grep -q 'REPLACE' EVIDENCE-MATRIX.csv
! grep -q 'REPLACE' HYPOTHESES.csv
! grep -q 'REPLACE' ACTIONS.csv
for code in A1 A2 A3 A4 A5 A6 A7; do grep -q "$code" ACTIONS.csv; done
grep -q 'First failed boundary' INCIDENT-RECORD.md
grep -q 'Rollback' RECOVERY-RUNBOOK.md
grep -q 'Data integrity' RECOVERY-VALIDATION.md
echo 'LAB 12 PASS'
