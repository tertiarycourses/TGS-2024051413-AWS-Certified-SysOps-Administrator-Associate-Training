#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import yaml
for f in ('managed-instance.yaml','document-install-healthcheck.yml'):
    yaml.safe_load(open(f))
PY
test -s evidence/managed-nodes.txt
test -s evidence/send-command.json
test -s evidence/compliance.txt
grep -q 'Rollback method' CHANGE-RECORD.md
echo 'LAB 03 PASS'
