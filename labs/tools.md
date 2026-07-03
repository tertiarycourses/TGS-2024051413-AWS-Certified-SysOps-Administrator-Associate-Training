# Tools Reference

## AWS Tools

| Tool | Use in Course |
| --- | --- |
| AWS Management Console | Main interface for guided labs. |
| AWS CloudShell | Browser-based shell with AWS CLI available. |
| AWS CLI | Identity checks, resource inspection, and operational commands. |
| Amazon CloudWatch | Metrics, logs, dashboards, and alarms. |
| AWS CloudTrail | API activity history and audit evidence. |
| Amazon EventBridge | Event rules and operational response workflows. |
| AWS Systems Manager | Instance management, Session Manager, Run Command, Patch Manager, and Automation. |
| AWS Budgets | Cost guardrails and alerts. |
| AWS Cost Explorer | Cost trend analysis. |
| AWS Trusted Advisor | Account-level operational recommendations. |

## Suggested AWS CLI Commands

```bash
aws sts get-caller-identity
aws configure list
aws ec2 describe-regions --output table
aws cloudwatch list-metrics --output table
aws cloudtrail lookup-events --max-results 5
aws resourcegroupstaggingapi get-resources --tag-filters Key=Course,Values=TGS-2024051413
```

## Cost Control Tips

- Prefer review-only exercises when a service is not Free Tier eligible.
- Stop or terminate EC2 instances after use.
- Delete load balancers, NAT gateways, snapshots, and databases when no longer needed.
- Set log retention on CloudWatch log groups.
- Empty S3 buckets before deleting them.
