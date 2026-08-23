# Lab 04 — Deploy and Test a Multi-AZ Highly Available Service

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 1
Topic: 04
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail's single-instance web service cannot survive an instance or Availability Zone disruption.

## Objective

Apply K4, K5, A3 and A5 by deploying an ALB and Auto Scaling service across two Availability Zones, testing health-based recovery and recording a controlled change.

## Deliverable

A two-AZ VPC web tier, ALB, target group, launch template, Auto Scaling group, failover evidence and cleanup record.

## Services and tools

VPC · EC2 · ALB · Auto Scaling · CloudWatch · CloudFormation

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-04-ha-autoscaling-failover/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review `ha-web-stack.yaml` and the architecture JPEG. Identify the two failure domains, health-check path, minimum capacity and rollback boundary.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Validate the template and deploy it with a unique suffix.

```bash
aws cloudformation validate-template --template-body file://ha-web-stack.yaml
aws cloudformation deploy --stack-name SysOps-Lab04-REPLACE_SUFFIX --template-file ha-web-stack.yaml --capabilities CAPABILITY_NAMED_IAM
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Read the stack outputs; save the ALB URL, target group and Auto Scaling group identifiers.

```bash
aws cloudformation describe-stacks --stack-name SysOps-Lab04-REPLACE_SUFFIX --query 'Stacks[0].Outputs' --output table | tee evidence/stack-outputs.txt
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Open the ALB URL repeatedly and confirm both Availability Zones contain healthy targets.

```bash
aws elbv2 describe-target-health --target-group-arn REPLACE_TARGET_GROUP_ARN --output table | tee evidence/target-health-before.txt
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Inspect desired, minimum and maximum capacity. Confirm the group is configured across two subnets.

```bash
aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names REPLACE_ASG_NAME --output json | tee evidence/asg-before.json
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Run the bounded failure test by terminating one learner-owned instance in the Auto Scaling group; record the UTC start time and change ID.

```bash
aws ec2 terminate-instances --instance-ids REPLACE_CANARY_INSTANCE_ID | tee evidence/termination.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Observe target health, replacement activity and ALB availability until desired capacity and health recover.

```bash
bash failover-observe.sh REPLACE_ASG_NAME REPLACE_TARGET_GROUP_ARN | tee evidence/failover-observation.txt
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Calculate detection and recovery time in `FAILOVER-REPORT.md`; explain whether the observed result meets the stated objective.

```bash
open FAILOVER-REPORT.md
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Create the target-tracking policy from `scaling-policy.json` only if the trainer approves a scaling demonstration.

```bash
aws autoscaling put-scaling-policy --cli-input-json file://scaling-policy.json | tee evidence/scaling-policy.json
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Capture ALB health, Auto Scaling activity and CloudWatch signals as JPEG evidence.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 11 — Run validation, delete the stack and wait for DELETE_COMPLETE before leaving the lab.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The service spans two Availability Zones, returns a healthy response during one-instance replacement, recovers desired capacity, records measured recovery time, and validation emits LAB 04 PASS.

## Evidence to retain

- [ ] Stack outputs
- [ ] Target health before/after
- [ ] Auto Scaling activity
- [ ] ALB response JPEG
- [ ] completed FAILOVER-REPORT.md
- [ ] cleanup.txt

## Acceptance criteria

- Two distinct Availability Zones
- Minimum and desired capacity at least two
- Health check represents application response
- Failure test affects only learner-owned canary
- Measured recovery and rollback are documented

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
