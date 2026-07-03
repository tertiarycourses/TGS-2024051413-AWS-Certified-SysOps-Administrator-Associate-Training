# Lab 08 - Incident Response, Runbooks, and Exam Review

## Objectives

- Practise structured operational troubleshooting.
- Collect evidence from AWS services.
- Create a reusable runbook.
- Review exam-style decision making.

## Scenario

Users report that an application is intermittently unavailable. You must investigate using AWS operational evidence and prepare a runbook that the next engineer can follow.

## Steps

1. Read the incident statement from your trainer.
2. Classify the severity and affected service area.
3. Identify the first evidence sources:
   - CloudWatch metrics.
   - CloudWatch logs.
   - CloudTrail events.
   - AWS Health events.
   - Load balancer target health.
   - VPC flow logs.
4. Build a timeline of symptoms.
5. Record recent changes from CloudTrail.
6. Check whether alarms fired before or after user reports.
7. Identify containment actions.
8. Identify recovery actions.
9. Identify rollback or failover options.
10. Draft a runbook with:
    - Trigger conditions.
    - Initial checks.
    - Investigation steps.
    - Escalation contacts.
    - Recovery steps.
    - Cleanup and follow-up.
11. Add preventive improvements such as alarms, tags, backup policies, or IAM controls.
12. Review common exam decision traps:
    - Security groups are stateful; NACLs are stateless.
    - Read replicas improve read scaling but are not the same as Multi-AZ failover.
    - Snapshots help recovery but do not replace tested restore procedures.
    - Monitoring data and audit events answer different questions.
13. Complete the final cleanup checklist.

## Validation

- You can explain the incident using evidence.
- You can separate symptom, cause, containment, and prevention.
- You can produce a runbook another learner can follow.
- You can answer scenario questions by matching requirements to AWS services.

## Cleanup

Delete temporary resources, alarms, dashboards, logs, sample event rules, and test data that are no longer required.

## Review Questions

1. Why should incident response start with evidence collection?
2. What is the difference between containment and recovery?
3. Why should a runbook include escalation criteria?
4. How do post-incident reviews improve operations?
