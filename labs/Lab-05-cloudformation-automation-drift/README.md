# Lab 05 — Control Infrastructure Change and Configuration Drift

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v5.0
Day: 2
Topic: 06
Estimated duration: 45–75 minutes

## Workplace scenario

A manual console change has made Northstar Retail's production-like environment differ from its approved template.

## Objective

Apply K3, K4, A4 and A5 by validating a CloudFormation template, reviewing a change set, detecting drift and using a Systems Manager Automation runbook with verification.

## Deliverable

A validated CloudFormation stack, reviewed change set, drift report, reconciliation decision, Automation verification and cleanup record.

## Services and tools

CloudFormation · Change Sets · Drift Detection · Systems Manager Automation · AWS CLI

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-05-cloudformation-automation-drift/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Validate `operations-stack.yaml` locally and with CloudFormation; inspect parameters, tags, deletion policy and output.

```bash
aws cloudformation validate-template --template-body file://operations-stack.yaml | tee evidence/template-validation.json
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Deploy the baseline stack and record its stack ID and output.

```bash
aws cloudformation deploy --stack-name SysOps-Lab05-REPLACE_SUFFIX --template-file operations-stack.yaml --parameter-overrides Environment=lab
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Edit only the working copy as instructed, then create—not execute—the change set.

```bash
aws cloudformation create-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange --template-body file://operations-stack.yaml --change-set-type UPDATE --parameters ParameterKey=Environment,ParameterValue=lab | tee evidence/change-set-create.json
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Describe the change set. Record every Add, Modify, Remove or Replacement action in `CHANGE-DECISION.md`.

```bash
aws cloudformation describe-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange | tee evidence/change-set-review.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Execute the trainer-approved change set and wait for UPDATE_COMPLETE.

```bash
aws cloudformation execute-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Create one safe manual tag drift on the learner-owned resource; record actor and UTC time.

```bash
aws s3api put-bucket-tagging --bucket REPLACE_BUCKET --tagging 'TagSet=[{Key=Course,Value=TGS-2024051413},{Key=DriftDemo,Value=manual}]'
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Start stack drift detection, wait for completion and export the resource drift detail.

```bash
aws cloudformation detect-stack-drift --stack-name SysOps-Lab05-REPLACE_SUFFIX | tee evidence/drift-detection.json
aws cloudformation describe-stack-resource-drifts --stack-name SysOps-Lab05-REPLACE_SUFFIX | tee evidence/drift-details.json
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Decide whether desired or actual state is correct. Reconcile through the template rather than hiding the drift.

```bash
open CHANGE-DECISION.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Create and execute `automation-runbook.yaml` against the learner-owned bucket; save the execution output.

```bash
aws ssm create-document --name SysOps-Lab05-VerifyBucket --document-type Automation --document-format YAML --content file://automation-runbook.yaml
aws ssm start-automation-execution --document-name SysOps-Lab05-VerifyBucket --parameters BucketName=REPLACE_BUCKET | tee evidence/automation.json
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Capture change-set and drift evidence as JPEG screenshots, run validation, then clean up.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The change set is reviewed before execution, drift evidence identifies the changed property, the decision record explains reconciliation, the Automation runbook verifies state, and validation emits LAB 05 PASS.

## Evidence to retain

- [ ] Template validation
- [ ] Change-set review
- [ ] Drift details
- [ ] Automation execution
- [ ] completed CHANGE-DECISION.md
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- No direct unreviewed production-style change
- Replacement actions explicitly reviewed
- Manual drift is confined to learner-owned resource
- Reconciliation decision cites evidence
- Automation has bounded permissions and explicit output

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
