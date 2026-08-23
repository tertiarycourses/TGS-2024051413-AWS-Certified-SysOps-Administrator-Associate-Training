# Lab 02 — Automate Event-Driven Incident Triage

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 1
Topic: 02
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail needs to detect an unapproved security-group change quickly, enrich the event and notify the operator without making an unsafe automatic network change.

## Objective

Apply K3, K4, A1 and A4 by routing a controlled AWS event through EventBridge, invoking a least-privilege remediation function and preserving an auditable triage record.

## Deliverable

An EventBridge rule, Lambda triage function, test event, CloudWatch Logs evidence and incident decision record.

## Services and tools

EventBridge · Lambda · CloudTrail · CloudWatch Logs · IAM

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-02-event-driven-incident-response/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review the architecture JPEG and `event-pattern.json`; identify event source, API names, principal context and target.

```bash
python3 -m json.tool event-pattern.json
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Inspect `triage.py`; confirm it records event identity and never modifies the security group.

```bash
python3 -m py_compile triage.py
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Create the trainer-approved execution role from `lambda-role-policy.json`; replace only the account-specific trust and resource values.

```bash
python3 -m json.tool lambda-role-policy.json
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Package and create the Lambda function with a unique learner suffix.

```bash
zip -j triage.zip triage.py
aws lambda create-function --function-name SysOps-Lab02-Triage-REPLACE_SUFFIX --runtime python3.13 --handler triage.handler --zip-file fileb://triage.zip --role REPLACE_ROLE_ARN
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Create the EventBridge rule and add the Lambda target; grant EventBridge permission to invoke only this function.

```bash
aws events put-rule --name SysOps-Lab02-SGChange --event-pattern file://event-pattern.json --state ENABLED
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Invoke the function with `test-event.json`; save the response and locate the matching CloudWatch Logs event.

```bash
aws lambda invoke --function-name SysOps-Lab02-Triage-REPLACE_SUFFIX --payload fileb://test-event.json evidence/invoke-response.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Generate one trainer-approved learner-owned security-group change, then verify the real event arrives through EventBridge.

```bash
aws logs tail /aws/lambda/SysOps-Lab02-Triage-REPLACE_SUFFIX --since 10m | tee evidence/triage-log.txt
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Complete `TRIAGE-DECISION.md`: impact, evidence, safe next action, authority, verification and escalation.

```bash
open TRIAGE-DECISION.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture EventBridge rule, Lambda monitor and log evidence as JPEG screenshots.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Run validation; delete the rule, target, permission, function and learner-owned test change.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The test and real events reach the Lambda target, logs contain the event ID and actor context, no automatic network modification occurs, the decision record names authority and verification, and validation emits LAB 02 PASS.

## Evidence to retain

- [ ] EventBridge rule export
- [ ] Lambda invocation response
- [ ] CloudWatch Logs export
- [ ] JPEG screenshots
- [ ] completed TRIAGE-DECISION.md
- [ ] cleanup.txt

## Acceptance criteria

- Event pattern is limited to named API calls
- Lambda role is least privilege
- Function performs triage only
- Event ID and UTC time are preserved
- Cleanup removes all learner-created automation

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
