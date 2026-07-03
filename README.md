# TGS-2024051413 - AWS Certified SysOps Administrator Associate Training

> Course: AWS Certified SysOps Administrator Associate Training  
> Course Code: TGS-2024051413  
> Register here: https://www.tertiarycourses.com.sg/wsq-aws-certified-sysops-administrator-associate-training.html

Hands-on AWS Certified SysOps Administrator Associate labs for learners building cloud operations skills and preparing for operations-focused AWS certification scenarios. The labs cover monitoring, logging, automation, compute operations, networking, storage, backup, databases, security, compliance, cost optimization, business continuity, and incident response.

Note: AWS currently positions this certification path through the updated AWS Certified CloudOps Engineer - Associate exam. These labs preserve the requested SysOps Administrator course naming while focusing on the underlying AWS operations skills.

## Courseware

| File | Description |
| --- | --- |
| [Learner Guide](LG-AWS-Certified-SysOps-Administrator-Associate-Training.md) | Detailed step-by-step guide for the full course. |
| [Labs Index](labs/README.md) | Quick access to all hands-on labs. |
| [Tools Reference](labs/tools.md) | Free and built-in AWS tools used in the labs. |

## How to Use

1. Open the learner guide first and review the account safety checklist.
2. Complete the labs in order because later labs reuse monitoring, tagging, IAM, and runbook practices from earlier labs.
3. Use an AWS Free Tier or training sandbox account where possible.
4. Delete or stop billable resources after each lab unless your trainer instructs otherwise.
5. Record screenshots, commands, and observations in your own lab journal.

## Lab Catalogue

### Domain 1: Monitoring, Logging, and Operations

| Lab | Title | Skills Practised |
| --- | --- | --- |
| [Lab 01](labs/lab-01-account-iam-monitoring-baseline.md) | Account Safety, IAM, and Monitoring Baseline | MFA, IAM, budgets, tags, CloudShell, operational baselines |
| [Lab 02](labs/lab-02-cloudwatch-cloudtrail-eventbridge-operations.md) | CloudWatch, CloudTrail, and EventBridge Operations | Metrics, logs, alarms, trails, event rules, operational visibility |

### Domain 2: Compute, Networking, Storage, and Continuity

| Lab | Title | Skills Practised |
| --- | --- | --- |
| [Lab 03](labs/lab-03-ec2-systems-manager-patching-automation.md) | EC2, Systems Manager, Patching, and Automation | EC2 operations, Session Manager, Run Command, Patch Manager, Automation |
| [Lab 04](labs/lab-04-vpc-networking-dns-load-balancing.md) | VPC Networking, DNS, and Load Balancing | Subnets, route tables, security groups, NACLs, Route 53, ELB, flow logs |
| [Lab 05](labs/lab-05-storage-backup-data-protection.md) | Storage, Backup, and Data Protection | S3, EBS snapshots, EFS, lifecycle policies, AWS Backup |
| [Lab 06](labs/lab-06-databases-ha-business-continuity.md) | Databases, High Availability, and Business Continuity | RDS, DynamoDB, backup, Multi-AZ, read replicas, RTO/RPO |

### Domain 3: Security, Cost, and Incident Response

| Lab | Title | Skills Practised |
| --- | --- | --- |
| [Lab 07](labs/lab-07-security-compliance-cost-optimization.md) | Security, Compliance, and Cost Optimization | KMS, GuardDuty, Security Hub, Config, Cost Explorer, Trusted Advisor |
| [Lab 08](labs/lab-08-incident-response-exam-review.md) | Incident Response, Runbooks, and Exam Review | Troubleshooting, evidence collection, runbooks, post-incident review |

## References

- AWS Certified SysOps Administrator - Associate: https://aws.amazon.com/certification/certified-sysops-admin-associate/
- Course registration: https://www.tertiarycourses.com.sg/wsq-aws-certified-sysops-administrator-associate-training.html
- AWS Documentation: https://docs.aws.amazon.com/
- AWS Skill Builder: https://skillbuilder.aws/

## Free Tools Used

- AWS Management Console
- AWS CloudShell
- AWS Command Line Interface
- Amazon CloudWatch
- AWS CloudTrail
- Amazon EventBridge
- AWS Systems Manager
- AWS Pricing Calculator
- AWS Free Tier eligible services where available
