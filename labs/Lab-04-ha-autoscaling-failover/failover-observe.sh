#!/usr/bin/env bash
set -euo pipefail
asg=${1:?ASG name required}; tg=${2:?target group ARN required}
for n in {1..20}; do
  date -u +%FT%TZ
  aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names "$asg" --query 'AutoScalingGroups[0].{Desired:DesiredCapacity,Instances:Instances[].{Id:InstanceId,State:LifecycleState,Health:HealthStatus}}'
  aws elbv2 describe-target-health --target-group-arn "$tg" --query 'TargetHealthDescriptions[].{Id:Target.Id,State:TargetHealth.State}'
  sleep 15
done
