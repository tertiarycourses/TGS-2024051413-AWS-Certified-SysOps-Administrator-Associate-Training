# Lab 07 — Build a Multi-Account Compliance Evidence Flow

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v5.0
Day: 2
Topic: 07
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail cannot demonstrate consistent security and service-quality controls across its training accounts.

## Objective

Apply K1, K3, A1 and A7 by evaluating required tags and encryption, aggregating findings and documenting a controlled remediation exception.

## Deliverable

A Config rule template, tag policy, findings register, remediation decision and service-quality scorecard.

## Services and tools

AWS Config · Organizations · Security Hub · EventBridge · Systems Manager Automation

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-07-config-security-compliance/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review the required state in `QUALITY-STANDARD.md`; define scope, evidence, owner, remediation SLA and exception expiry.

```bash
open QUALITY-STANDARD.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Validate `config-controls.yaml` and `tag-policy.json`; replace the approved delivery channel and organisation values.

```bash
aws cloudformation validate-template --template-body file://config-controls.yaml
python3 -m json.tool tag-policy.json
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Deploy the Config controls in the learner account and record the recorder and delivery status.

```bash
aws cloudformation deploy --stack-name SysOps-Lab07-REPLACE_SUFFIX --template-file config-controls.yaml --capabilities CAPABILITY_NAMED_IAM
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Create one compliant and one intentionally noncompliant learner-owned test resource.

```bash
aws resourcegroupstaggingapi get-resources --tag-filters Key=Course,Values=TGS-2024051413 | tee evidence/tagged-resources.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Run rule evaluation and export compliant/noncompliant resources with timestamps.

```bash
aws configservice get-compliance-details-by-config-rule --config-rule-name required-tags | tee evidence/config-findings.json
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Review `sample-security-findings.json`; prioritise by severity, exposure, asset and exploitability—not count alone.

```bash
python3 -m json.tool sample-security-findings.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Complete `REMEDIATION-REGISTER.csv` with owner, due date, chosen automation and verification.

```bash
open REMEDIATION-REGISTER.csv
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Document one time-bound exception with business owner, compensating control and expiry.

```bash
open EXCEPTION-RECORD.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture Config compliance and finding summary as JPEG evidence; run validation.

```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Remove intentional noncompliance and delete learner-created controls; retain the evidence files.

```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

Required controls evaluate learner-owned resources, findings are prioritised with context, remediation has owner/SLA/verification, the exception expires, and validation emits LAB 07 PASS.

## Evidence to retain

- [ ] Config findings
- [ ] tagged resources export
- [ ] completed remediation register
- [ ] exception record
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- Scope and standard are explicit
- Every finding has an owner
- Exception has compensating control and expiry
- Verification proves compliant state
- Intentional noncompliance is removed

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
