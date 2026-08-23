# Lab 11 — Diagnose Storage and Database Performance, Then Recover

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 3
Topic: 09
Estimated duration: 45–75 minutes

## Workplace scenario

A transactional workload shows rising latency after a change, and the operator must determine whether compute, storage, connections or query behaviour is the bottleneck.

## Objective

Apply K1, K4, A1, A4 and A6 by correlating EBS/RDS signals, selecting a safe change and validating data recovery.

## Deliverable

A metric analysis, bottleneck decision, change plan, restore checklist and database recovery evidence.

## Services and tools

CloudWatch · EBS · RDS · Performance Insights · AWS Backup

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-11-storage-database-recovery/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Open `data/metrics.csv`; define units, timestamps and expected baseline before calculating any conclusion.

```bash
column -s, -t data/metrics.csv
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Run `analyse_metrics.py`; inspect the output ranking and confirm the highest deviation is reproducible.

```bash
python3 analyse_metrics.py | tee evidence/metric-analysis.txt
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Compare CPU, EBS queue, IOPS, throughput, connections and latency in `BOTTLENECK-DECISION.md`.

```bash
open BOTTLENECK-DECISION.md
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Inspect the learner RDS configuration and CloudWatch metrics for the same interval where available.

```bash
aws rds describe-db-instances --db-instance-identifier REPLACE_DB --output json | tee evidence/rds-config.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Review Performance Insights or database-engine evidence for waits, slow statements or locks; record limitations if unavailable.

```bash
open QUERY-EVIDENCE.md
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Propose one reversible action with risk, owner, expected signal and rollback; do not change multiple variables.

```bash
open CHANGE-PLAN.md
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Create a snapshot or approved recovery point and record its timestamp and status.

```bash
aws rds create-db-snapshot --db-instance-identifier REPLACE_DB --db-snapshot-identifier sysops-lab11-REPLACE_SUFFIX | tee evidence/snapshot.json
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Restore to an isolated learner identifier and verify engine status and a trainer-provided data check.

```bash
aws rds restore-db-instance-from-db-snapshot --db-instance-identifier sysops-lab11-restore-REPLACE_SUFFIX --db-snapshot-identifier sysops-lab11-REPLACE_SUFFIX | tee evidence/restore.json
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture metrics, snapshot and restore evidence as JPEGs; record actual recovery timing.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Run validation; delete the isolated restore and learner snapshot when approved.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

Metric calculations are reproducible, the chosen bottleneck cites evidence, one reversible action is proposed, recovery is isolated and timed, and validation emits LAB 11 PASS.

## Evidence to retain

- [ ] Metric analysis
- [ ] RDS configuration
- [ ] query evidence
- [ ] snapshot/restore records
- [ ] completed bottleneck and change decisions
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- Units and baseline stated
- Cause remains a hypothesis until tested
- One variable changed
- Restore does not overwrite source
- Data validation and actual timing recorded

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
