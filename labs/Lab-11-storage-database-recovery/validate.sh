#!/usr/bin/env bash
set -euo pipefail
python3 analyse_metrics.py | grep -q 'PASS'
test -s evidence/metric-analysis.txt
test -s evidence/snapshot.json
test -s evidence/restore.json
grep -q 'Ranked hypothesis' BOTTLENECK-DECISION.md
grep -q 'Actual restore time' CHANGE-PLAN.md
echo 'LAB 11 PASS'
