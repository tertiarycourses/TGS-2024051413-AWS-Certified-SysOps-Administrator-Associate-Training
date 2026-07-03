# Learner Guide - AWS Certified SysOps Administrator Associate Training

## Course Overview

This learner guide supports a hands-on AWS operations course for the AWS Certified SysOps Administrator Associate training path. The course is designed for learners who need to monitor, maintain, secure, troubleshoot, and optimize AWS workloads.

AWS has updated this certification path under the newer AWS Certified CloudOps Engineer - Associate direction. The labs in this repository keep the requested SysOps Administrator course title and focus on the practical operations skills that remain central to AWS cloud operations.

## Before You Start

### Account Safety Checklist

1. Use a training AWS account where possible.
2. Enable MFA for the root user.
3. Do not use the root user for daily work.
4. Create or use an IAM administrator role for lab activities.
5. Set an AWS Budget before creating resources.
6. Apply a consistent tag such as `Course=TGS-2024051413` to lab resources.
7. Record the AWS Region used for each lab.
8. Clean up resources after each lab.

### Recommended Lab Journal

For every lab, record:

- Lab number and date.
- Region used.
- Resource names and tags.
- Key console pages visited.
- Commands run in CloudShell or AWS CLI.
- Screenshots of completed checkpoints.
- Cleanup confirmation.

## Learning Outcomes

By the end of the course, you should be able to:

1. Establish safe account, IAM, budget, and tagging practices.
2. Monitor AWS workloads with CloudWatch metrics, logs, alarms, and dashboards.
3. Trace account activity with CloudTrail.
4. React to operational events with EventBridge.
5. Manage EC2 instances with Systems Manager.
6. Troubleshoot VPC connectivity, DNS, and load balancing.
7. Protect data with encryption, snapshots, versioning, lifecycle rules, and backups.
8. Explain database availability, backup, and recovery options.
9. Use security and compliance services to detect risks.
10. Apply cost optimization checks and operational runbooks.

## Two-Day Course Flow

### Day 1

| Time | Activity |
| --- | --- |
| 09:00 | Course briefing, AWS account safety, certification context |
| 09:30 | Lab 01 - Account Safety, IAM, and Monitoring Baseline |
| 11:00 | Lab 02 - CloudWatch, CloudTrail, and EventBridge Operations |
| 13:00 | Lab 03 - EC2, Systems Manager, Patching, and Automation |
| 15:30 | Lab 04 - VPC Networking, DNS, and Load Balancing |
| 17:00 | Review and cleanup |

### Day 2

| Time | Activity |
| --- | --- |
| 09:00 | Day 1 recap and troubleshooting review |
| 09:30 | Lab 05 - Storage, Backup, and Data Protection |
| 11:00 | Lab 06 - Databases, High Availability, and Business Continuity |
| 13:00 | Lab 07 - Security, Compliance, and Cost Optimization |
| 15:00 | Lab 08 - Incident Response, Runbooks, and Exam Review |
| 16:30 | Final cleanup and exam readiness checklist |

## Lab 01 Guide - Account Safety, IAM, and Monitoring Baseline

### Objectives

- Secure account access with MFA and least privilege.
- Create an operational tagging and naming baseline.
- Enable budget visibility.
- Confirm CloudShell and AWS CLI access.

### Steps

1. Sign in to the AWS Management Console.
2. Confirm the Region selected for the course.
3. Open IAM and review the difference between users, groups, roles, and policies.
4. Confirm MFA is enabled for privileged access.
5. Create a lab administrator role or use the role provided by your trainer.
6. Open AWS CloudShell.
7. Run `aws sts get-caller-identity` to confirm your active identity.
8. Create a tag standard for lab resources, for example `Course=TGS-2024051413` and `Owner=<your-name>`.
9. Open AWS Budgets and create a small cost budget for the lab account.
10. Open CloudWatch and create a simple dashboard named `SysOps-Lab-Dashboard`.
11. Add a text widget listing the course code, Region, and cleanup reminder.

### Checkpoint

You can explain which identity you are using, what permissions it has, what Region is active, and how you will detect unexpected cost.

### Cleanup

Keep the budget and dashboard if your trainer wants you to reuse them. Otherwise delete the dashboard at the end of the course.

## Lab 02 Guide - CloudWatch, CloudTrail, and EventBridge Operations

### Objectives

- Inspect metrics and logs.
- Create alarms and dashboards.
- Trace account API activity with CloudTrail.
- Create event-driven operational notifications.

### Steps

1. Open CloudWatch Metrics and inspect available namespaces.
2. Review EC2, billing, and service metrics available in the account.
3. Create an alarm for a metric available in your lab account.
4. Set the alarm threshold to a safe demonstration value.
5. Add the alarm to the dashboard created in Lab 01.
6. Open CloudWatch Logs and inspect log groups if any exist.
7. Create a sample log group named `/training/sysops/sample`.
8. Set a retention period to avoid indefinite storage.
9. Open CloudTrail and review Event history.
10. Filter events by your IAM principal name.
11. Identify a console login or AWS API call.
12. Open EventBridge and review the default event bus.
13. Create a rule pattern for a simple AWS API event.
14. Discuss safe notification targets with your trainer.

### Checkpoint

You can locate a CloudTrail event, read a CloudWatch metric, explain alarm state, and describe how EventBridge can trigger an operational response.

### Cleanup

Delete sample event rules and unused log groups if instructed.

## Lab 03 Guide - EC2, Systems Manager, Patching, and Automation

### Objectives

- Review EC2 operations.
- Connect with Systems Manager Session Manager.
- Run commands and collect inventory.
- Understand patching and automation runbooks.

### Steps

1. Open EC2 and review AMIs, instance types, key pairs, and security groups.
2. Launch a small training instance only if permitted by your trainer.
3. Attach or confirm an IAM instance profile that allows Systems Manager.
4. Open Systems Manager Fleet Manager.
5. Confirm the instance appears as a managed node.
6. Open Session Manager and start a shell session.
7. Use Run Command to execute a safe command such as `hostname`.
8. Review command output and command history.
9. Open Inventory and review discovered software or instance metadata.
10. Open Patch Manager and review patch baselines.
11. Open Automation and inspect common AWS managed runbooks.
12. Discuss when automation is safer than manual console changes.

### Checkpoint

You can connect to an instance without opening SSH to the internet and can explain the purpose of Run Command, Patch Manager, and Automation.

### Cleanup

Terminate any EC2 instance launched for the lab unless your trainer asks you to keep it.

## Lab 04 Guide - VPC Networking, DNS, and Load Balancing

### Objectives

- Review VPC building blocks.
- Compare security groups and network ACLs.
- Understand route tables and internet access.
- Inspect DNS, load balancers, and flow logs.

### Steps

1. Open the VPC console and review the default VPC.
2. Identify public and private subnet patterns.
3. Open route tables and locate a route to an internet gateway if present.
4. Compare route tables associated with different subnets.
5. Review security groups and identify inbound and outbound rules.
6. Review network ACLs and compare their stateless behavior with security groups.
7. Open VPC Flow Logs and review where logs can be delivered.
8. Review VPC endpoints and explain how they reduce public internet dependency.
9. Open EC2 Load Balancers and compare Application, Network, and Gateway Load Balancers.
10. Open Route 53 and review hosted zones if available.
11. Use Reachability Analyzer conceptually or in a safe sandbox if available.
12. Draw a simple request path from a user to a workload in a public subnet.

### Checkpoint

You can troubleshoot a basic connectivity issue by checking security groups, NACLs, route tables, DNS, and load balancer health.

### Cleanup

Remove any flow logs, test load balancers, or network resources created for the lab.

## Lab 05 Guide - Storage, Backup, and Data Protection

### Objectives

- Configure safe object storage settings.
- Understand encryption, versioning, and lifecycle.
- Create and restore from snapshots.
- Use AWS Backup for policy-based protection.

### Steps

1. Open Amazon S3 and create a training bucket if permitted.
2. Keep public access blocked unless the trainer explicitly demonstrates public hosting.
3. Enable bucket versioning.
4. Enable default encryption.
5. Upload a small sample file.
6. Modify the file and observe version history.
7. Create a lifecycle rule for noncurrent versions.
8. Open EC2 Volumes and review EBS volume attributes.
9. Create an EBS snapshot only in a safe training environment.
10. Review snapshot encryption and sharing settings.
11. Open Amazon EFS and compare file storage with object and block storage.
12. Open AWS Backup and review backup vaults, plans, and protected resources.
13. Create a sample backup plan only if your account policy permits it.

### Checkpoint

You can choose between S3, EBS, EFS, and AWS Backup for common operational scenarios.

### Cleanup

Delete sample S3 objects, snapshots, backup plans, and vaults that are not needed.

## Lab 06 Guide - Databases, High Availability, and Business Continuity

### Objectives

- Understand managed database operations.
- Compare backup, restore, Multi-AZ, and replica options.
- Define RTO and RPO.
- Plan continuity patterns for common workloads.

### Steps

1. Open Amazon RDS and review engine options.
2. Inspect backup retention settings for an example DB configuration.
3. Compare automated backups and manual snapshots.
4. Review Multi-AZ deployment behavior.
5. Review read replica use cases.
6. Discuss Aurora availability and storage behavior.
7. Open DynamoDB and review tables if available.
8. Review DynamoDB point-in-time recovery and on-demand backup concepts.
9. Compare regional and multi-Region recovery patterns.
10. Define RTO and RPO for three sample workloads.
11. Map backup and failover choices to the sample workloads.
12. Identify which services are managed by AWS and which tasks remain your responsibility.

### Checkpoint

You can explain which database recovery option matches a workload's RTO, RPO, cost, and operational complexity.

### Cleanup

Delete any sample database or table resources created in the lab.

## Lab 07 Guide - Security, Compliance, and Cost Optimization

### Objectives

- Review security posture services.
- Use encryption and compliance checks.
- Detect cost risks.
- Recommend optimization actions.

### Steps

1. Open IAM Access Analyzer and review findings if available.
2. Open AWS KMS and inspect customer managed key concepts.
3. Open GuardDuty and review detector concepts.
4. Open Security Hub and review security standards.
5. Open Amazon Inspector and review vulnerability scanning coverage.
6. Open AWS Config and inspect rules and resource timelines if available.
7. Open Trusted Advisor and review available checks.
8. Open Cost Explorer and identify daily service cost trends.
9. Open AWS Budgets and confirm alert thresholds.
10. Open Compute Optimizer and review rightsizing concepts.
11. Review tags and discuss how they support cost allocation.
12. Prepare three optimization recommendations for a sample workload.

### Checkpoint

You can separate security detection, compliance tracking, and cost optimization responsibilities across AWS services.

### Cleanup

Disable any trial services or sample configurations if your trainer instructs you to do so.

## Lab 08 Guide - Incident Response, Runbooks, and Exam Review

### Objectives

- Practise structured incident response.
- Collect operational evidence.
- Build a simple runbook.
- Review exam-style decision making.

### Steps

1. Read the sample incident scenario in Lab 08.
2. Classify the incident by severity and likely service area.
3. Identify first evidence sources: CloudWatch, CloudTrail, Config, service health, and application logs.
4. Create a timeline of symptoms and actions.
5. Identify immediate containment actions.
6. Identify recovery actions and rollback options.
7. Draft a runbook with triggers, investigation steps, escalation, and cleanup.
8. Add preventive controls such as alarms, tags, backup policies, or IAM guardrails.
9. Review common exam traps: confusing NACLs with security groups, snapshots with backups, and monitoring with tracing.
10. Complete the final readiness checklist.

### Checkpoint

You can respond to an operational problem using evidence, containment, recovery, and prevention rather than random console changes.

### Cleanup

Remove temporary alarms, dashboards, sample resources, and test data.

## Final Readiness Checklist

Before finishing the course, confirm that you can:

- Explain the shared responsibility model for operations.
- Use IAM safely and avoid root user operations.
- Create CloudWatch alarms and read CloudTrail events.
- Use Systems Manager for instance management.
- Diagnose common VPC routing and security issues.
- Select storage and backup options for a scenario.
- Explain RDS and DynamoDB recovery options.
- Identify basic security posture and compliance findings.
- Use AWS cost tools to detect waste.
- Write a practical operational runbook.

## Cleanup Checklist

1. Terminate EC2 instances.
2. Delete load balancers and target groups.
3. Delete unused EBS volumes and snapshots.
4. Empty and delete sample S3 buckets.
5. Delete test CloudWatch log groups, dashboards, and alarms.
6. Delete sample EventBridge rules.
7. Delete sample backup plans and vaults.
8. Delete test database resources.
9. Confirm AWS Budgets and Cost Explorer show no unexpected activity.
