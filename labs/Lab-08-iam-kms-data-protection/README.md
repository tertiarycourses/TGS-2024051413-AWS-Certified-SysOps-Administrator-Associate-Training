# Lab 08 — Diagnose IAM Access and Protect Data with KMS

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 2
Topic: 07
Estimated duration: 45–75 minutes

## Workplace scenario

A learner workload is denied access to an encrypted object after a policy change, while an earlier role remains broader than required.

## Objective

Apply K1, K3, A1 and A7 by explaining an access decision, narrowing permissions and verifying encryption and key-policy behaviour.

## Deliverable

A policy-evaluation worksheet, corrected least-privilege policy, KMS key-policy review and encrypted-object evidence.

## Services and tools

IAM · Access Analyzer · Policy Simulator · KMS · S3 · CloudTrail

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-08-iam-kms-data-protection/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Read `ACCESS-SCENARIO.md`; identify principal, action, resource, conditions, boundary and possible explicit denies.

```bash
open ACCESS-SCENARIO.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Validate the supplied identity, bucket and KMS policy JSON before reasoning about the decision.

```bash
for f in identity-policy.json bucket-policy.json kms-key-policy.json; do python3 -m json.tool "$f" >/dev/null; done
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Use the IAM policy simulator or trainer-provided equivalent to test GetObject on the exact learner object ARN.

```bash
aws iam simulate-principal-policy --policy-source-arn REPLACE_ROLE_ARN --action-names s3:GetObject kms:Decrypt --resource-arns REPLACE_OBJECT_ARN REPLACE_KEY_ARN | tee evidence/simulation.json
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Inspect CloudTrail for the denied request and record error code, principal, resource and UTC time.

```bash
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=GetObject --max-results 20 | tee evidence/cloudtrail-deny.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Complete `ACCESS-DECISION.md` in evaluation order; distinguish the S3 allow from the KMS decrypt requirement.

```bash
open ACCESS-DECISION.md
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Edit `identity-policy.json` to the exact bucket prefix and key; retain no wildcard action.

```bash
open identity-policy.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Upload and retrieve a small encrypted learner-owned object, then verify encryption metadata.

```bash
aws s3api head-object --bucket REPLACE_BUCKET --key lab08/evidence.txt | tee evidence/head-object.json
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Run Access Analyzer validation on the policies and resolve ERROR findings.

```bash
aws accessanalyzer validate-policy --policy-document file://identity-policy.json --policy-type IDENTITY_POLICY | tee evidence/policy-validation.json
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture policy simulation and encrypted-object evidence as JPEG screenshots; run validation.

```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Remove the learner test object and any temporary role/policy; do not schedule KMS key deletion without trainer approval.

```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The decision path explains the deny, corrected policy uses exact actions/resources, encrypted-object metadata is verified, Access Analyzer reports no ERROR, and validation emits LAB 08 PASS.

## Evidence to retain

- [ ] Policy simulation
- [ ] CloudTrail denied event
- [ ] policy validation
- [ ] encrypted object metadata
- [ ] completed ACCESS-DECISION.md
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- No wildcard action
- Resource scope is exact
- KMS and S3 permissions both considered
- Explicit deny precedence explained
- Temporary access is removed

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
