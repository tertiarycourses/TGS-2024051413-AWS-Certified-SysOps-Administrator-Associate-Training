# Lab 04 - VPC Networking, DNS, and Load Balancing

## Objectives

- Identify VPC networking components.
- Troubleshoot routing and filtering layers.
- Review DNS and load balancing concepts.
- Understand VPC Flow Logs and connectivity analysis.

## Scenario

A workload is unreachable. You need to inspect the network path and determine whether the issue is routing, security rules, DNS, or load balancer health.

## Steps

1. Open the VPC console.
2. Review the default VPC or trainer-provided VPC.
3. Identify subnets and their Availability Zones.
4. Open route tables.
5. Locate routes to an internet gateway, NAT gateway, or local VPC target.
6. Review security groups attached to a sample workload.
7. Identify inbound and outbound rules.
8. Review network ACLs for the same subnet.
9. Compare stateful security groups with stateless NACLs.
10. Open VPC Flow Logs and review delivery options.
11. Enable flow logs only if your trainer permits it.
12. Open EC2 Load Balancers.
13. Compare Application Load Balancer and Network Load Balancer use cases.
14. Review target group health checks.
15. Open Route 53 and review hosted zones if available.
16. Discuss how DNS records direct users to load balancers.
17. Open Reachability Analyzer if available and review how it models a path.
18. Draw the request path from user to DNS to load balancer to target.

## Validation

- You can identify at least four points where connectivity can fail.
- You can distinguish security groups from NACLs.
- You can explain what a target group health check confirms.
- You can describe when flow logs help with troubleshooting.

## Cleanup

Delete any flow logs, load balancers, or networking resources created for the lab.

## Review Questions

1. What route is required for a public subnet to reach the internet?
2. Why might a security group allow traffic while a NACL blocks it?
3. What does an unhealthy load balancer target indicate?
4. How can VPC endpoints improve security and operations?
