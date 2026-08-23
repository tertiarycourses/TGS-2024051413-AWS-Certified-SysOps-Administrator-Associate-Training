# Lab 10 — Operate DNS and Content-Delivery Failover

Course: AWS Certified SysOps Administrator Associate Training (TGS-2024051413)
Version: v6.0
Day: 3
Topic: 08
Estimated duration: 45–75 minutes

## Workplace scenario

Northstar Retail needs a controlled failover path for a public web endpoint and must distinguish DNS, origin and cache effects during an incident.

## Objective

Apply K2 and A2 by configuring health-aware DNS and CloudFront behaviour, then proving client-visible routing and cache outcomes.

## Deliverable

A Route 53 health-check definition, failover record plan, CloudFront operations checklist and measured failover report.

## Services and tools

Route 53 · Health Checks · CloudFront · S3 · CloudWatch

## Safety and cost boundary

- Use only the learner AWS account and Region authorised by the trainer.
- Replace every `REPLACE_...` token with a learner-owned identifier before execution.
- Tag resources with `Course=TGS-2024051413` and a unique learner suffix.
- Do not change shared or production resources.
- Run cleanup, verify deletion, and report retained chargeable resources before leaving the lab.

## Folder map

```text
Lab-10-route53-cloudfront-failover/
├── README.md
├── INSTRUCTIONS.docx / INSTRUCTIONS.pdf
├── CHECKLIST.md
├── EXPECTED-ARCHITECTURE.jpg
├── evidence/
└── AWS-native editable YAML, JSON, CLI, shell or Python files
```

## Detailed procedure

### Step 1 — Review `DNS-FAILOVER-PLAN.md`; record hosted zone, primary/secondary endpoints, TTL, health criteria and rollback authority.

```bash
open DNS-FAILOVER-PLAN.md
```

Record the observed result in the evidence folder before continuing.
### Step 2 — Validate `health-check.json`; replace the trainer-provided test endpoint and unique caller reference.

```bash
python3 -m json.tool health-check.json
```

Record the observed result in the evidence folder before continuing.
### Step 3 — Create the health check and confirm CloudWatch health status before associating any record.

```bash
aws route53 create-health-check --caller-reference SysOps-Lab10-REPLACE_SUFFIX --health-check-config file://health-check.json | tee evidence/health-check.json
```

Record the observed result in the evidence folder before continuing.
### Step 4 — Review `failover-records.json`; confirm PRIMARY and SECONDARY identifiers, evaluate-target-health setting and TTL.

```bash
python3 -m json.tool failover-records.json
```

Record the observed result in the evidence folder before continuing.
### Step 5 — Apply the trainer-approved learner-zone record change and record the change ID.

```bash
aws route53 change-resource-record-sets --hosted-zone-id REPLACE_ZONE_ID --change-batch file://failover-records.json | tee evidence/record-change.json
```

Record the observed result in the evidence folder before continuing.
### Step 6 — Query the name repeatedly from two resolvers; record answers and TTL before failure injection.

```bash
for n in {1..5}; do date -u +%FT%TZ; dig +noall +answer REPLACE_NAME; sleep 5; done | tee evidence/dns-before.txt
```

Record the observed result in the evidence folder before continuing.
### Step 7 — Run the bounded primary failure approved by the trainer; measure health-check change and client answer transition.

```bash
for n in {1..20}; do date -u +%FT%TZ; dig +short REPLACE_NAME; sleep 10; done | tee evidence/dns-failover.txt
```

Record the observed result in the evidence folder before continuing.
### Step 8 — Inspect CloudFront response headers for cache status, age and request ID; distinguish cached content from origin recovery.

```bash
curl -I https://REPLACE_DISTRIBUTION/ | tee evidence/cloudfront-headers.txt
```

Record the observed result in the evidence folder before continuing.
### Step 9 — Complete `FAILOVER-REPORT.md` with observed TTL, health transition, client transition and limitation.

```bash
open FAILOVER-REPORT.md
```

Record the observed result in the evidence folder before continuing.
### Step 10 — Capture DNS health and CloudFront evidence as JPEGs; run validation and restore the baseline.

```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Record the observed result in the evidence folder before continuing.

## Verification

Health and record evidence are linked, failover timing is measured rather than assumed, cache and DNS effects are distinguished, baseline is restored, and validation emits LAB 10 PASS.

## Evidence to retain

- [ ] Health check
- [ ] record change
- [ ] DNS before/failover results
- [ ] CloudFront headers
- [ ] completed failover report
- [ ] JPEG evidence
- [ ] cleanup.txt

## Acceptance criteria

- Uses learner-owned hosted zone
- Primary and secondary identifiers are explicit
- TTL is measured
- Cache response is distinguished from origin
- Rollback restores baseline

## Troubleshooting

- `AccessDenied`: identify the denied API action and resource; do not broaden permissions without trainer approval.
- `ValidationError`: confirm the active Region, stack state, parameter values and unresolved `REPLACE_...` tokens.
- Empty evidence: verify the command used the intended account, Region, resource ID and time window.
- Unexpected cost: stop the activity, capture resource identifiers, and run the supplied cleanup procedure.
- Cleanup failure: retain the error output and escalate; never hide a resource that remains active.
