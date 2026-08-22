#!/usr/bin/env bash
set -euo pipefail
for f in identity-policy.json bucket-policy.json kms-key-policy.json; do python3 -m json.tool "$f" >/dev/null; done
test -s evidence/simulation.json
test -s evidence/cloudtrail-deny.json
test -s evidence/policy-validation.json
grep -q 'Final decision and evidence' ACCESS-DECISION.md
echo 'LAB 08 PASS'
