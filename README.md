# AWS Certified SysOps Administrator Associate Training

Course code: **TGS-2024051413**
Duration: **3 days / 24 hours**
Provider: **Tertiary Infotech Academy Pte Ltd**

[![Course](https://img.shields.io/badge/WSQ-TGS--2024051413-1f6feb)](https://www.tertiarycourses.com.sg/wsq-aws-certified-sysops-administrator-associate-training.html)
[![AWS](https://img.shields.io/badge/AWS-CloudOps-ff9900)](https://aws.amazon.com/certification/certified-cloudops-engineer-associate/)

This repository contains the learner-facing v5.0 courseware and twelve self-contained AWS operations labs. The approved WSQ course title remains SysOps Administrator; certification-readiness content follows the current AWS Certified CloudOps Engineer — Associate (SOA-C03) blueprint.

![AWS CloudOps course visual](courseware/assets/aws-sysops-cover-hero.png)

## Courseware

| Resource | Description |
| --- | --- |
| [Learner Guide](LG-AWS-Certified-SysOps-Administrator-Associate-Training.md) | Detailed concepts, step-by-step lab procedures, troubleshooting and assessment readiness. |
| [Labs index](labs/README.md) | All 12 labs, scheduled at exactly four labs per day. |
| `courseware/` | v5.0 PowerPoint/PDF, Learner Guide DOCX/PDF and Lesson Plan DOCX/PDF. |

## Three-Day Lab Journey

| Day | Labs | Operational focus |
| --- | --- | --- |
| 1 | 01–04 | Observability, event-driven triage, EC2 fleet operations and Multi-AZ failover |
| 2 | 05–08 | Infrastructure automation, restore assurance, compliance and IAM/KMS protection |
| 3 | 09–12 | Network diagnosis, DNS/content delivery failover, data recovery and incident capstone |

## Labs

1. [Build an Observability and Incident Detection Baseline](labs/Lab-01-observability-incident-baseline/README.md)
2. [Automate Event-Driven Incident Triage](labs/Lab-02-event-driven-incident-response/README.md)
3. [Operate an EC2 Fleet with Systems Manager](labs/Lab-03-ec2-ssm-patching-automation/README.md)
4. [Deploy and Test a Multi-AZ Highly Available Service](labs/Lab-04-ha-autoscaling-failover/README.md)
5. [Control Infrastructure Change and Configuration Drift](labs/Lab-05-cloudformation-automation-drift/README.md)
6. [Prove Backup and Restore Readiness](labs/Lab-06-backup-restore-assurance/README.md)
7. [Build a Multi-Account Compliance Evidence Flow](labs/Lab-07-config-security-compliance/README.md)
8. [Diagnose IAM Access and Protect Data with KMS](labs/Lab-08-iam-kms-data-protection/README.md)
9. [Troubleshoot a VPC Connectivity Path](labs/Lab-09-vpc-path-diagnostics/README.md)
10. [Operate DNS and Content-Delivery Failover](labs/Lab-10-route53-cloudfront-failover/README.md)
11. [Diagnose Storage and Database Performance, Then Recover](labs/Lab-11-storage-database-recovery/README.md)
12. [Resolve a Multi-Service CloudOps Incident](labs/Lab-12-integrated-incident-capstone/README.md)

Every lab folder includes detailed Markdown, DOCX and PDF instructions, a JPEG architecture/reference image, an evidence checklist, editable AWS-native YAML/JSON/CLI/shell/Python assets, and cleanup guidance.

## Safety

- Use only the trainer-authorised learner AWS account and Region.
- Replace every `REPLACE_...` placeholder with a learner-owned identifier.
- Never commit credentials, private keys, full account IDs or customer data.
- Capture evidence before cleanup, then verify deletion of chargeable resources.

## References

- [Course registration](https://www.tertiarycourses.com.sg/wsq-aws-certified-sysops-administrator-associate-training.html)
- [AWS Certified CloudOps Engineer — Associate](https://aws.amazon.com/certification/certified-cloudops-engineer-associate/)
- [SOA-C03 exam guide](https://docs.aws.amazon.com/aws-certification/latest/sysops-administrator-associate-03/sysops-administrator-associate-03.html)
- [AWS documentation](https://docs.aws.amazon.com/)

Assessment papers and answer keys are confidential and intentionally excluded from this public repository.
