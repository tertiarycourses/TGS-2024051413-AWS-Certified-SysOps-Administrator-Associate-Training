# Lab 02 - CloudWatch, CloudTrail, and EventBridge Operations

## Objectives

- Inspect CloudWatch metrics and logs.
- Create an operational alarm.
- Find CloudTrail events.
- Understand EventBridge event-driven operations.

## Scenario

An operations team needs visibility into service behavior and account activity. You will configure basic monitoring and learn where to find evidence during an investigation.

## Steps

1. Open CloudWatch.
2. Go to Metrics and review available namespaces.
3. Choose a metric that exists in your account, such as EC2, billing, or another active service metric.
4. Graph the metric and change the time range.
5. Create an alarm with a safe demonstration threshold.
6. Add the alarm widget to `SysOps-Lab-Dashboard`.
7. Go to CloudWatch Logs.
8. Create a log group named `/training/sysops/sample` if permitted.
9. Set log retention to a short period such as 7 days.
10. Open CloudTrail.
11. Go to Event history.
12. Filter by your username, role session, or event source.
13. Locate an event generated during the current lab session.
14. Record the event time, event name, source IP, and user identity.
15. Open Amazon EventBridge.
16. Review the default event bus.
17. Create a sample rule pattern for an AWS API event if your trainer permits it.
18. Discuss possible targets such as SNS, Lambda, or Systems Manager Automation.

## Validation

- You can read a metric graph.
- You can describe alarm states.
- You can find an API action in CloudTrail.
- You can explain how EventBridge supports automated response.

## Cleanup

Delete sample EventBridge rules and unused log groups. Keep the dashboard if it is used by later labs.

## Review Questions

1. When would you use CloudWatch Logs instead of CloudTrail?
2. What does an alarm in `INSUFFICIENT_DATA` mean?
3. How can EventBridge reduce manual response time?
4. Why should log retention be configured?
