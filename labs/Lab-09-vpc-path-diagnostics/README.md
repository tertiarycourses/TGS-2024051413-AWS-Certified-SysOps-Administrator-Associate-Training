# Lab 09 — Troubleshoot a VPC Connectivity Path

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 3
Topic: 08
Estimated duration: 45–75 minutes

## Workplace scenario

A private application instance is healthy locally but cannot reach an approved service endpoint after a network change.

## Objective

Apply K2 and A2 by isolating a failed request through DNS, routes, security groups, network ACLs, target health and VPC Flow Logs.

## Deliverable

A VPC diagnostic worksheet, reachability/flow-log evidence, corrected network control and before/after result.

## Services and tools

VPC · Reachability Analyzer · Flow Logs · Security Groups · NACLs · Endpoints

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-09-vpc-path-diagnostics/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review `PATH-DIAGRAM.md`; write source, destination, protocol, port, expected route and success response.

```bash
open PATH-DIAGRAM.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Run `diagnostics.sh` with the learner source and destination; retain every command result even when it fails.

```bash
bash diagnostics.sh REPLACE_SOURCE_ENI REPLACE_DESTINATION_IP | tee evidence/diagnostics.txt
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Confirm DNS resolution and compare the returned address with the intended private/public path.

```bash
dig +short REPLACE_HOSTNAME | tee evidence/dns.txt
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Inspect source and destination subnet route tables using longest-prefix-match reasoning.

```bash
aws ec2 describe-route-tables --filters Name=association.subnet-id,Values=REPLACE_SUBNET_ID | tee evidence/routes.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Inspect security-group rules in both directions and state whether return traffic is automatically allowed.

```bash
aws ec2 describe-security-groups --group-ids REPLACE_SG_ID | tee evidence/security-group.json
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Inspect network ACL rules by number in both directions, including ephemeral return ports.

```bash
aws ec2 describe-network-acls --filters Name=association.subnet-id,Values=REPLACE_SUBNET_ID | tee evidence/nacl.json
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Create or run Reachability Analyzer where supported and record the first blocking component.

```bash
aws ec2 start-network-insights-analysis --network-insights-path-id REPLACE_PATH_ID | tee evidence/reachability.json
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Query Flow Logs for ACCEPT/REJECT evidence correlated to source, destination, port and UTC time.

```bash
open FLOW-LOG-QUERY.txt
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Change only the identified learner-owned control; repeat the same test and record before/after evidence.

```bash
open DIAGNOSTIC-REPORT.md
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Capture route, rule and result as JPEG evidence; run validation and restore temporary changes.

```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

The report follows the path in order, names the first failed boundary with evidence, changes one learner-owned control, verifies success with the same test, and validation emits LAB 09 PASS.

## Evidence to retain

- [ ] DNS result
- [ ] route tables
- [ ] security-group and NACL exports
- [ ] reachability analysis
- [ ] Flow Log query
- [ ] completed diagnostic report
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- Source/destination/protocol/port explicit
- Route and policy evaluated separately
- Stateful/stateless return path explained
- One variable changed
- Before/after test is identical

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
