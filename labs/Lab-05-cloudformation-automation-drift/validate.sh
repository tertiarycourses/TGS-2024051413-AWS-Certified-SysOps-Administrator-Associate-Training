#!/usr/bin/env bash
set -euo pipefail
test -s evidence/template-validation.json
test -s evidence/change-set-review.json
test -s evidence/drift-details.json
test -s evidence/automation.json
grep -q 'Reason and evidence' CHANGE-DECISION.md
echo 'LAB 05 PASS'
