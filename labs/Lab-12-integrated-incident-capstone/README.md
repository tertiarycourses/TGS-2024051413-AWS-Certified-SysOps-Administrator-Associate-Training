# Lab 12 — Capstone — Resolve a Multi-Service CloudOps Incident

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 3
Topic: 10
Estimated duration: 45–75 minutes

## Workplace scenario

After a routine change, Northstar Retail experiences elevated web latency, intermittent 5xx responses, rejected VPC traffic, an incomplete backup job and a security finding.

## Objective

Apply A1–A7 in one connected incident by detecting impact, isolating the failed boundary, restoring service, validating data and documenting service-quality improvements.

## Deliverable

A timeline, evidence matrix, prioritised hypotheses, recovery runbook, validation record and post-incident action register.

## Services and tools

CloudWatch · CloudTrail · VPC Flow Logs · ELB · AWS Backup · Security Hub · Systems Manager

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-12-integrated-incident-capstone/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Read every file in `data/`; record evidence source, timestamp, timezone and reliability in `EVIDENCE-MATRIX.csv`.

```bash
for f in data/*; do echo "--- $f"; sed -n '1,80p' "$f"; done
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Run `build_timeline.py`; verify the merged timeline is chronologically sorted and retains source IDs.

```bash
python3 build_timeline.py | tee evidence/timeline-build.txt
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Frame impact, scope and declared severity without naming a root cause yet.

```bash
open INCIDENT-RECORD.md
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Rank at least three hypotheses and name one discriminating test for each.

```bash
open HYPOTHESES.csv
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Identify the first failed boundary by correlating ALB health, Flow Logs, change events and application latency.

```bash
open output/timeline.csv
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Review backup and security evidence; decide which items block recovery and which become follow-up actions.

```bash
open EVIDENCE-MATRIX.csv
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Complete `RECOVERY-RUNBOOK.md` with authority, exact action, safety check, verification, communication and rollback.

```bash
open RECOVERY-RUNBOOK.md
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Execute the trainer-approved simulation action or tabletop step; record UTC timestamps and observed outputs.

```bash
open RECOVERY-VALIDATION.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Validate service health, request success, data integrity, security control and recovery objective.

```bash
open RECOVERY-VALIDATION.md
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Complete `ACTIONS.csv` with preventive, detective and recovery controls, owner, due date and verification threshold.

```bash
open ACTIONS.csv
```

Record the observed result in the evidence folder before continuing.
### Step 11 — Deliver a five-minute operational briefing: impact, evidence, decision, recovery, limitation and next controls.

```bash
open INCIDENT-RECORD.md
```

Record the observed result in the evidence folder before continuing.
### Step 12 — Capture the final dashboard/architecture evidence as JPEG and run the capstone validator.

```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Record the observed result in the evidence folder before continuing.

## Verification

All evidence IDs reconcile, the timeline precedes causal claims, recovery and rollback are explicit, validation covers service and data, A1–A7 are mapped, and validation emits LAB 12 PASS.

## Evidence to retain

- [ ] timeline.csv
- [ ] evidence matrix
- [ ] hypothesis register
- [ ] incident record
- [ ] recovery runbook
- [ ] recovery validation
- [ ] ACTIONS.csv
- [ ] five-minute briefing
- [ ] JPEG evidence

## Acceptance criteria

- A1–A7 traceability complete
- Observation and hypothesis separated
- First failed boundary supported
- Recovery includes rollback and communication
- Every action has owner, due date and measurable verification

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
