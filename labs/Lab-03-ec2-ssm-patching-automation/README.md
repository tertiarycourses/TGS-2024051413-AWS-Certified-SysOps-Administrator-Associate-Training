# Lab 03 — Operate an EC2 Fleet with Systems Manager

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v5.0
Day: 1
Topic: 03
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail must remove public SSH access and make patching repeatable across tagged web instances.

## Objective

Apply K3, K5, A3 and A5 by onboarding a managed node, using Session Manager and Run Command, assessing patch compliance and executing a controlled Automation runbook.

## Deliverable

An EC2 managed node, SSM document, patch-compliance report, automation execution record and rollback evidence.

## Services and tools

EC2 · IAM · Systems Manager · Session Manager · Run Command · Patch Manager · Automation

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-03-ec2-ssm-patching-automation/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review `managed-instance.yaml`; choose the trainer-provided VPC/subnet and confirm the AMI is supported in the assigned Region.

```bash
aws cloudformation validate-template --template-body file://managed-instance.yaml
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Deploy the stack using a unique learner suffix and the required IAM capability.

```bash
aws cloudformation deploy --stack-name SysOps-Lab03-REPLACE_SUFFIX --template-file managed-instance.yaml --capabilities CAPABILITY_NAMED_IAM --parameter-overrides CourseTag=TGS-2024051413
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Obtain the instance ID from stack outputs and wait until Systems Manager reports it online.

```bash
aws ssm describe-instance-information --filters Key=tag:Course,Values=TGS-2024051413 --output table | tee evidence/managed-nodes.txt
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Start a Session Manager session. Confirm there is no inbound SSH rule and capture the managed shell evidence.

```bash
aws ssm start-session --target REPLACE_INSTANCE_ID
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Create the custom SSM document from `document-install-healthcheck.yml` and inspect its status.

```bash
aws ssm create-document --name SysOps-Lab03-HealthCheck --document-type Command --document-format YAML --content file://document-install-healthcheck.yml
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Run the document against the managed node with a concurrency of one and record the command ID.

```bash
aws ssm send-command --document-name SysOps-Lab03-HealthCheck --targets Key=tag:Course,Values=TGS-2024051413 --max-concurrency 1 --max-errors 0 | tee evidence/send-command.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Review Inventory and patch compliance. Explain the baseline, severity and approval rules in `CHANGE-RECORD.md`.

```bash
aws ssm list-compliance-items --resource-ids REPLACE_INSTANCE_ID --resource-types ManagedInstance --output table | tee evidence/compliance.txt
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Execute the read-only Automation runbook and save the output. Do not scale beyond one node until its evidence passes.

```bash
aws ssm start-automation-execution --document-name AWS-DescribeInstanceInformation --parameters InstanceIds=REPLACE_INSTANCE_ID | tee evidence/automation.json
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Capture Fleet Manager, compliance and command output as JPEG evidence; compare with `EXPECTED-ARCHITECTURE.jpg`.

```bash
open EXPECTED-ARCHITECTURE.jpg
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Complete the change record with risk, owner, success metric, rollback and UTC timestamps.

```bash
open CHANGE-RECORD.md
```

Record the observed result in the evidence folder before continuing.
### Step 11 — Run `validate.sh`, then remove the custom document and CloudFormation stack.

```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The instance is managed without public SSH, the custom document validates, command and compliance evidence are present, the change record includes verification and rollback, and validation emits LAB 03 PASS.

## Evidence to retain

- [ ] Managed-node inventory
- [ ] Session Manager JPEG
- [ ] Run Command output
- [ ] Patch compliance export
- [ ] Automation execution
- [ ] completed CHANGE-RECORD.md
- [ ] cleanup.txt

## Acceptance criteria

- No inbound SSH from the internet
- Instance profile grants only required managed-node permissions
- Canary concurrency is one
- Patch status is explained
- Rollback and cleanup are documented

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
