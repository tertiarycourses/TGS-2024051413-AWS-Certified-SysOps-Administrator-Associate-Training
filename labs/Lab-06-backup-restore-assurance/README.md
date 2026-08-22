# Lab 06 — Prove Backup and Restore Readiness

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v5.0
Day: 2
Topic: 05
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail reports successful backup jobs but has never proven that the protected data can be restored within its business objectives.

## Objective

Apply K4, A1, A4 and A6 by protecting an S3/EBS-style workload, restoring into isolation and measuring actual recovery evidence.

## Deliverable

A backup plan, selection, restore checklist, recovery evidence and measured RTO/RPO report.

## Services and tools

AWS Backup · S3 · EBS · KMS · CloudWatch Events

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-06-backup-restore-assurance/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Read `RECOVERY-OBJECTIVES.md`; agree the workload scope, RTO, RPO, retention and restore-validation method.

```bash
open RECOVERY-OBJECTIVES.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Validate `backup-plan.json` and replace the learner-specific vault and role values.

```bash
python3 -m json.tool backup-plan.json
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Create the backup vault and plan with the trainer-approved encryption key and retention.

```bash
aws backup create-backup-vault --backup-vault-name SysOps-Lab06-REPLACE_SUFFIX
aws backup create-backup-plan --backup-plan file://backup-plan.json | tee evidence/backup-plan.json
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Create the resource selection from `backup-selection.json`; target only resources tagged for this course.

```bash
aws backup create-backup-selection --backup-plan-id REPLACE_PLAN_ID --backup-selection file://backup-selection.json | tee evidence/selection.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Start an on-demand backup and record start/completion times, recovery-point ARN and status.

```bash
aws backup start-backup-job --backup-vault-name SysOps-Lab06-REPLACE_SUFFIX --resource-arn REPLACE_RESOURCE_ARN --iam-role-arn REPLACE_BACKUP_ROLE_ARN | tee evidence/backup-job.json
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Restore to an isolated learner-owned target; never overwrite the original resource.

```bash
aws backup start-restore-job --recovery-point-arn REPLACE_RECOVERY_POINT_ARN --iam-role-arn REPLACE_RESTORE_ROLE_ARN --metadata file://restore-metadata.json | tee evidence/restore-job.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Validate restored object count, checksum or application-readable state; record the exact method and result.

```bash
shasum -a 256 sample-data.txt | tee evidence/source-checksum.txt
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Complete `RECOVERY-REPORT.md` with actual RTO, observed RPO, integrity result, gaps and owners.

```bash
open RECOVERY-REPORT.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture backup and restore job status as JPEG evidence and compare with the architecture reference.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Run validation; remove the restored target and learner-created plan after retention/permission checks.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

A completed recovery point is restored to an isolated target, integrity is checked, actual recovery is compared with RTO/RPO, gaps have owners, and validation emits LAB 06 PASS.

## Evidence to retain

- [ ] Backup plan and selection
- [ ] Backup job
- [ ] Restore job
- [ ] checksum evidence
- [ ] completed RECOVERY-REPORT.md
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- Scope uses course tags
- Restore target is isolated
- Retention is explicit
- Integrity validation is objective
- Actual RTO/RPO and gaps are recorded

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
