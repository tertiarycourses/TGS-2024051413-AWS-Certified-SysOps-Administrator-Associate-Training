# Lab 01 - Account Safety, IAM, and Monitoring Baseline

## Objectives

- Confirm safe AWS account access.
- Review IAM users, groups, roles, and policies.
- Set a budget and tagging standard.
- Create a basic CloudWatch dashboard.

## Scenario

You are onboarding to operate an AWS environment. Before creating workloads, you must confirm who you are, what permissions you have, how costs will be watched, and how resources will be tagged.

## Steps

1. Sign in to the AWS Management Console.
2. Select the Region assigned by your trainer.
3. Open IAM and review the root user security recommendations.
4. Confirm MFA is enabled for privileged access.
5. Review the IAM role or user assigned to you for the lab.
6. Open AWS CloudShell.
7. Run:

   ```bash
   aws sts get-caller-identity
   aws configure list
   ```

8. Record the account ID, principal ARN, and active Region in your lab journal.
9. Define the resource tags for the course:
   - `Course=TGS-2024051413`
   - `Owner=<your-name>`
   - `Purpose=Training`
10. Open AWS Budgets.
11. Create a cost budget with a low alert threshold suitable for a training account.
12. Open CloudWatch.
13. Create a dashboard named `SysOps-Lab-Dashboard`.
14. Add a text widget that lists the course code, Region, and cleanup reminder.
15. Save the dashboard.

## Validation

- You can identify your AWS principal.
- You can explain why root access should be avoided.
- You created or reviewed a budget.
- You created a CloudWatch dashboard.

## Cleanup

Keep the budget during the course. Delete the dashboard only when your trainer says it is no longer needed.

## Review Questions

1. Why is MFA important for privileged identities?
2. What is the difference between an IAM user and an IAM role?
3. How do tags help operations teams?
4. Why should budgets be configured before labs begin?
