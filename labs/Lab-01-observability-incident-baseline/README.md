# Lab 01 — Build an Observability and Incident Detection Baseline

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v5.0
Day: 1
Topic: 02
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail has intermittent web latency but no agreed baseline, owner or repeatable incident-evidence process.

## Objective

Apply K1, K3, K4, A1 and A4 by creating a dashboard, alarm, CloudTrail evidence query and EventBridge detection rule for one tagged workload.

## Deliverable

A CloudWatch dashboard, alarm definition, EventBridge pattern, evidence log and validation screenshots.

## Services and tools

CloudWatch · CloudTrail · EventBridge · SNS · AWS CLI · CloudShell

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-01-observability-incident-baseline/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Open `LAB-PLAN.md`; record the assigned Region, workload tag, notification email and cost boundary before creating resources.

```bash
open LAB-PLAN.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Confirm the active identity and Region in CloudShell. Save the output in `evidence/caller-identity.txt`.

```bash
aws sts get-caller-identity | tee evidence/caller-identity.txt
aws configure get region | tee evidence/region.txt
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Create or select a small tagged EC2 training workload and confirm the `Course=TGS-2024051413` tag is visible.

```bash
aws ec2 describe-instances --filters 'Name=tag:Course,Values=TGS-2024051413' --query 'Reservations[].Instances[].{Id:InstanceId,State:State.Name,AZ:Placement.AvailabilityZone}' --output table
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Replace the placeholder instance ID in `cloudwatch-dashboard.json`, then create the dashboard.

```bash
aws cloudwatch put-dashboard --dashboard-name SysOps-Lab01 --dashboard-body file://cloudwatch-dashboard.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Replace the placeholder values in `alarm.json`; create the CPU alarm and verify its current state.

```bash
aws cloudwatch put-metric-alarm --cli-input-json file://alarm.json
aws cloudwatch describe-alarms --alarm-names SysOps-Lab01-HighCPU
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Review CloudTrail Event history for your identity and export recent management events.

```bash
aws cloudtrail lookup-events --max-results 20 --query 'Events[].{Time:EventTime,Name:EventName,User:Username}' --output table | tee evidence/cloudtrail-events.txt
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Create the EventBridge rule from `event-pattern.json`; add the trainer-approved SNS target only after subscription confirmation.

```bash
aws events put-rule --name SysOps-Lab01-ConsoleChange --event-pattern file://event-pattern.json --state ENABLED
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Generate one safe configuration event, locate it in CloudTrail and confirm the EventBridge rule metric changes.

```bash
aws events describe-rule --name SysOps-Lab01-ConsoleChange | tee evidence/event-rule.txt
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Complete `INCIDENT-EVIDENCE.md`: separate observation, hypothesis, impact, next test and owner.

```bash
open INCIDENT-EVIDENCE.md
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Capture the dashboard, alarm and event rule as JPEG screenshots; compare them with `EXPECTED-ARCHITECTURE.jpg`.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 11 — Run `validate.sh`; resolve missing placeholders or evidence before cleanup.

```bash
bash validate.sh
```

Record the observed result in the evidence folder before continuing.
### Step 12 — Delete the lab rule, alarm and dashboard unless the trainer approves reuse; record cleanup evidence.

```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The dashboard and alarm reference the assigned workload; CloudTrail evidence names the actor and event; the EventBridge pattern is valid; the incident record distinguishes observation from hypothesis; validation emits LAB 01 PASS.

## Evidence to retain

- [ ] Dashboard JPEG
- [ ] Alarm JPEG
- [ ] CloudTrail event export
- [ ] EventBridge rule export
- [ ] completed INCIDENT-EVIDENCE.md
- [ ] cleanup.txt

## Acceptance criteria

- No placeholder values remain
- All resources carry the course tag where supported
- Alarm has an owner and action
- Evidence includes UTC timestamps
- No unapproved paid resource remains

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
