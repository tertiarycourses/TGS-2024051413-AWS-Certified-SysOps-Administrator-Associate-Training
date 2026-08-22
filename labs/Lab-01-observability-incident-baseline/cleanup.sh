#!/usr/bin/env bash
set -u
aws events remove-targets --rule SysOps-Lab01-ConsoleChange --ids Lab01Target 2>/dev/null || true
aws events delete-rule --name SysOps-Lab01-ConsoleChange 2>/dev/null || true
aws cloudwatch delete-alarms --alarm-names SysOps-Lab01-HighCPU 2>/dev/null || true
aws cloudwatch delete-dashboards --dashboard-names SysOps-Lab01 2>/dev/null || true
echo 'Lab 01 shared resources removed where present.'
