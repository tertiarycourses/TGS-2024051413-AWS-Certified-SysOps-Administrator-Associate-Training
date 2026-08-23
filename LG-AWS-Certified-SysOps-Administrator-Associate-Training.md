# AWS Certified SysOps Administrator Associate Training — Learner Guide

**Course code:** TGS-2024051413
**Version:** v6.0 · 23 August 2026
**Training provider:** Tertiary Infotech Academy Pte Ltd · UEN: 201200696W


## How to Use This Guide

The slide deck explains systems, relationships and operational decisions. This Learner Guide and the individual lab folders contain the detailed procedures, command examples, evidence checkpoints and acceptance criteria.

- Read the topic explanation before starting its aligned lab.
- Work only in the trainer-authorised learner AWS account and Region.
- Replace all REPLACE placeholders with learner-owned identifiers.
- Capture evidence before cleanup, then verify that chargeable resources are deleted.
- Never place access keys, passwords, account IDs or customer data in a lab submission.


## Course and WSQ Alignment

| Field | Approved value |
| --- | --- |
| Course | AWS Certified SysOps Administrator Associate Training |
| Course code | TGS-2024051413 |
| TSC | Cloud Computing Application (LOG-TEM-3007-1.1) |
| Duration | 3 days · 24 hours · 22 hours facilitated delivery + 2 hours assessment |
| Labs | 12 self-contained labs · exactly 4 labs per day |
| Assessment | WA-SAQ: 5 questions / 60 min + Case Study: 5 tasks / 60 min |


### Learning Outcomes

- LO1: Maintain business continuity of AWS cloud operations to ensure stable service delivery.
- LO2: Implement secure AWS cloud infrastructure setup such as data loading and performance monitoring.
- LO3: Apply service quality standards to ensure security and compliance of AWS cloud operations.
- LO4: Analyse and resolve processing issues to ensure continuity and disaster recovery in AWS cloud applications.
- LO5: Troubleshoot networking performance issues at scale for optimal AWS infrastructure operation.


### Knowledge and Ability Statements

| Code | Statement |
| --- | --- |
| K1 | Cloud computing infrastructure components and technologies |
| K2 | Installation, configuration and troubleshooting of cloud computing infrastructures |
| K3 | Installation, configuration and troubleshooting of software packages supporting cloud computing infrastructures |
| K4 | Design, configuration, maintenance and troubleshooting of cloud computing applications |
| K5 | Virtualisation technologies |
| A1 | Implement data loading, security, performance monitoring and tuning, capacity planning, backup and recovery |
| A2 | Implement performance diagnostics and troubleshooting at scale in a live environment |
| A3 | Maintain availability and performance of cloud computing operations and ensure secure services with no unplanned downtime |
| A4 | Analyse processing issues and data anomalies and identify solutions |
| A5 | Implement and release cloud computing operations changes |
| A6 | Implement IT risk-management measures for business continuity and disaster recovery |
| A7 | Implement service-quality standards |


### Three-Day Learning Journey


#### Day 1 — Foundations, observability, EC2 and fleet operations

| Start | End | Facilitated activity |
| --- | --- | --- |
| 09:30 | 10:15 | Administration, outcomes and CloudOps transition |
| 10:15 | 11:45 | Topic 01 — Cloud Operations Foundations |
| 11:45 | 13:30 | Topic 02 — Monitoring and Incident Response + Labs 01–02 |
| 14:30 | 16:30 | Topic 03 — EC2 and Systems Management + Lab 03 |
| 16:30 | 18:30 | Topic 04 — Reliability and High Availability + Lab 04 |


#### Day 2 — Reliability, continuity, deployment automation and security

| Start | End | Facilitated activity |
| --- | --- | --- |
| 09:30 | 11:30 | Topic 05 — Backup and Continuity + Lab 06 |
| 11:30 | 13:30 | Topic 06 — Provisioning and Automation + Lab 05 |
| 14:30 | 16:30 | Topic 07 — Security and Compliance + Labs 07–08 |
| 16:30 | 18:30 | Change, recovery and compliance synthesis across four labs |


#### Day 3 — Networking, data operations, integrated troubleshooting and assessment

| Start | End | Facilitated activity |
| --- | --- | --- |
| 09:30 | 11:30 | Topic 08 — Networking, DNS and Content Delivery + Labs 09–10 |
| 11:30 | 13:30 | Topic 09 — Storage and Database Operations + Lab 11 |
| 14:30 | 16:30 | Topic 10 — Integrated Troubleshooting + Lab 12 capstone |
| 16:30 | 18:30 | Written Assessment (60 min) + Case Study (60 min) |


### Assessment Design

- Written Assessment (WA-SAQ) — five open-ended questions, 60 minutes, open book.
- Case Study (CS) — five connected tasks, 60 minutes, open book.
- Structure mirrors the Drive-held controlled papers and Assessment Plan v5.0: five WA questions covering K1–K5 and five Case Study tasks covering A1–A7.

> **Operational note:** Answer keys are trainer-only. Candidate papers may be learner-facing through LMS-TMS; keys must not be published to LMS-TMS or public GitHub.


## Source Register and Current Certification Context

| Authority | Source | Use in this release |
| --- | --- | --- |
| WSQ authority | Live Tertiary course page and Assessment Plan v5.0 | Course code, 24-hour duration, five LO, K1–K5, A1–A7 and WA+CS design. |
| Legacy content | Reference v3/v4 PowerPoints and Drive Activities dataset | Preserved useful EC2, SSM, CloudFormation, storage, monitoring, security and networking coverage; procedures moved out of the deck. |
| Certification authority | AWS Certified CloudOps Engineer - Associate SOA-C03 Exam Guide v1.1 | Current five-domain blueprint and scope, including containers, multi-account operations, automation and IaC. |
| Architecture guidance | AWS Well-Architected Framework and official AWS service documentation | Operational excellence, security, reliability, performance, cost and sustainability practices. |
| Assessment authority | Drive-held WA/CS v2 papers and Assessment Plan v5.0 | Instrument type, five-item counts, 60-minute timings and controlled K/A coverage. |

The certification role is now AWS Certified CloudOps Engineer — Associate (SOA-C03). The approved WSQ title and course code remain unchanged. This release uses the current five-domain exam guide for readiness while preserving approved WSQ learning outcomes and assessment design.

| SOA-C03 domain | Weight |
| --- | --- |
| Monitoring, logging, analysis, remediation and performance optimisation | 22% |
| Reliability and business continuity | 22% |
| Deployment, provisioning and automation | 22% |
| Security and compliance | 16% |
| Networking and content delivery | 18% |


## AWS Lab Environment and Safety

| Control | Required practice |
| --- | --- |
| Identity | Confirm account alias or permitted account identifier, caller identity and Region before every deployment. |
| Ownership | Tag all resources with Course=TGS-2024051413 and a unique learner suffix. |
| Least privilege | Investigate denied actions; do not attach broad administrator policies as a shortcut. |
| Change boundary | Use canaries, change sets, bounded concurrency, health signals and rollback. |
| Cost | Use small lab resources, approved Regions and explicit cleanup. |
| Evidence | Save command output, timestamps, decisions, validation and cleanup results. |
| Secrets | Never commit credentials, tokens, private keys or full account identifiers. |

```bash
aws sts get-caller-identity
aws configure get region
aws resourcegroupstaggingapi get-resources --tag-filters Key=Course,Values=TGS-2024051413
```


### Common Lab Troubleshooting

| Symptom | Safe response |
| --- | --- |
| AccessDenied | Identify the API action and resource; check role, boundary, SCP and key policy before requesting scoped permission. |
| ValidationError | Check Region, parameters, resource state and unresolved placeholders. |
| No metric or log | Confirm namespace, dimensions, time range, integration and retention. |
| Health check fails | Follow DNS, route, security group, NACL, target and dependency in order. |
| Cleanup fails | Preserve error output, identify retained dependencies and escalate immediately. |


## Cloud Operations Knowledge


### Topic 01 — Cloud Operations Foundations

Alignment: LO1 · LO2 · K1 · K5 · A1 · Foundation across all five SOA-C03 domains. Shared responsibility · regions and zones · operational excellence · SOA-C03 transition

| Key idea | Explanation |
| --- | --- |
| Operate for outcomes | Availability, security, performance and cost are managed as measurable service outcomes. |
| Know the responsibility boundary | AWS secures the cloud; customers secure configurations, identities, data and workloads in the cloud. |
| Design for failure domains | Regions, Availability Zones and edge locations create distinct resilience and latency choices. |
| Use evidence before change | Metrics, logs, configuration history and events establish the operational baseline. |


#### SysOps to CloudOps — What Changed

| Area | Legacy SOA-C02 emphasis | Current SOA-C03 emphasis |
| --- | --- | --- |
| Role name | SysOps Administrator | CloudOps Engineer |
| Workloads | EC2-heavy operations | Compute, containers, serverless and hybrid operations |
| Scope | Six broad domains | Five task-oriented domains |
| Automation | AWS-native operations | IaC, Git and third-party automation are explicit |

> **Operational note:** The WSQ course title and code remain unchanged; exam-readiness content follows the current SOA-C03 guide.


#### The Cloud Operations Control Loop

| Stage | Operational meaning |
| --- | --- |
| Observe | Signals and context |
| Assess | Impact and risk |
| Decide | Runbook and authority |
| Change | Small and reversible |
| Verify | Outcome and evidence |
| Learn | Prevent recurrence |

> **Operational note:** PROFESSIONAL STANDARD — Every operational change must have a reason, owner, verification signal and rollback path.


#### AWS Global Infrastructure

| Concept | Explanation |
| --- | --- |
| Region | Geographic boundary for sovereignty, latency and disaster-recovery decisions. |
| Availability Zone | Independent failure domain connected with low-latency networking. |
| Edge | CloudFront and Route 53 move delivery and routing closer to users. |
| Local and hybrid | Outposts, Local Zones and connected environments extend the operating boundary. |


#### Availability Improves with Independent Failure Domains

| Category | Illustrative availability target (%) |
| --- | --- |
| Single instance | 99.0 |
| Two AZs | 99.9 |
| Three AZs | 99.95 |
| Two Regions | 99.99 |

> **Operational note:** More failure domains increase potential resilience only when dependencies, health checks and failover are also designed correctly.


#### Shared Responsibility by Layer

| Layer | AWS responsibility | Customer responsibility |
| --- | --- | --- |
| Facilities and hardware | Physical security, hosts and core network | Choose Regions and resilience strategy |
| Managed service | Service infrastructure and platform | Identity, configuration, data and use |
| EC2 workload | Underlying facilities and hypervisor | Guest OS, patches, application and traffic controls |
| Data | Durable service mechanisms | Classification, encryption, retention and access |


#### Well-Architected Operational Questions

Prepare: What must be observable?; What runbooks and permissions exist?.

Operate: What is normal?; Who responds to deviation?.

Evolve: What did evidence teach?; Which control prevents recurrence?.


#### Operations Mindset

The console is an interface—not the source of truth.

> **Operational note:** Treat configuration, telemetry, change history and verification evidence as the durable operational record.


### Topic 02 — Monitoring, Logging and Incident Response

Alignment: LO2 · LO4 · K1 · K3 · K4 · A1 · A4 · SOA-C03 Domain 1 · 22%. CloudWatch · CloudTrail · EventBridge · alarms · anomaly detection · remediation

| Key idea | Explanation |
| --- | --- |
| Metrics show behaviour | Dimensions, periods and statistics turn raw measurements into service signals. |
| Logs explain events | Structured records provide detail for search, correlation, retention and audit. |
| Traces connect dependencies | A request path exposes latency and failure across distributed components. |
| Incidents require controlled response | Detection, triage, containment, recovery and learning form one evidence chain. |


#### Telemetry Pipeline

| Stage | Operational meaning |
| --- | --- |
| Instrument | Metrics, logs and traces |
| Collect | Agents and service integrations |
| Store | Retention and protection |
| Analyse | Queries and correlation |
| Alert | Actionable threshold |
| Remediate | Human or automation |

> **Operational note:** DESIGN TEST — A signal is useful only when it identifies impact, owner and next safe action.


#### CloudWatch, CloudTrail and Config

| Service | Primary question | Typical evidence |
| --- | --- | --- |
| CloudWatch | How is the workload behaving? | Metrics, logs, alarms and dashboards |
| CloudTrail | Who called which AWS API, when and from where? | Management and data events |
| AWS Config | What configuration existed and was it compliant? | Configuration history and rule evaluation |


#### Composite Signals Reduce Alert Noise

| Category | Alerts per week | Actionable alerts |
| --- | --- | --- |
| Raw threshold | 84 | 9 |
| Sustained breach | 31 | 9 |
| Composite alarm | 14 | 8 |
| Anomaly + impact | 7 | 7 |

> **Operational note:** Filtering transient and context-free signals can preserve actionable detection while reducing noise.


#### Alarm Design

| Concept | Explanation |
| --- | --- |
| Statistic | Average can hide peaks; percentiles expose tail latency. |
| Period | Short periods detect quickly but may amplify noise. |
| Missing data | Choose breaching, not breaching, ignore or missing deliberately. |
| Action | Notify, scale or remediate only with tested permissions and rollback. |


#### Incident Lifecycle

| Stage | Operational meaning |
| --- | --- |
| Detect | Signal and timestamp |
| Triage | Scope and severity |
| Contain | Limit blast radius |
| Recover | Restore service |
| Verify | Health and data integrity |
| Review | Actions and owners |

> **Operational note:** A4 CONNECTION — Separate observed evidence, hypothesis, decision and result throughout the incident record.


#### Threshold vs Anomaly Detection

| Choice | Strength | Use when |
| --- | --- | --- |
| Static threshold | Transparent and predictable | A meaningful limit is known |
| Anomaly detection | Adapts to time-varying baseline | Seasonality makes one limit noisy |
| Composite alarm | Combines symptom and impact | One signal alone is insufficient |
| Metric math | Derives rates and ratios | Raw counts need context |


#### Automation Guardrails

Trigger: Use sustained evidence; Prevent recursive events.

Authority: Least-privilege execution role; Separate approval for high-risk action.

Verification: Check intended state; Escalate when remediation fails.

> **Operational note:** Applied in Lab 01 — Build an Observability and Incident Detection Baseline, Lab 02 — Automate Event-Driven Incident Triage.


### Topic 03 — Compute, Virtualisation and Systems Management

Alignment: LO1 · LO2 · K3 · K5 · A3 · A5 · SOA-C03 Domains 1 and 3. EC2 lifecycle · AMIs · placement · Systems Manager · patching · Image Builder

| Key idea | Explanation |
| --- | --- |
| Treat instances as managed nodes | Inventory, patch, access and automate consistently across a fleet. |
| Images are controlled supply-chain inputs | Build, scan, test and version AMIs instead of hand-configuring servers. |
| Placement affects failure and performance | Spread, partition and cluster strategies solve different operational needs. |
| Lifecycle actions need coordination | Launch, stop, terminate and scale transitions require hooks and evidence. |


#### EC2 Purchase and Capacity Models

| Model | Operational value | Risk / constraint |
| --- | --- | --- |
| On-Demand | Flexible baseline and unpredictable workloads | Higher unit cost |
| Savings Plans | Commitment discount across eligible usage | Forecast and commitment risk |
| Reserved capacity | Capacity assurance in an AZ | Scope and utilisation management |
| Spot | Large discount for interruptible work | Two-minute interruption and capacity variability |


#### Golden Image Pipeline

| Stage | Operational meaning |
| --- | --- |
| Source | Hardened base image |
| Build | Versioned components |
| Scan | Vulnerability and policy |
| Test | Boot and workload checks |
| Distribute | Accounts and Regions |
| Retire | Deprecate old images |

> **Operational note:** A5 CONTROL — An image release is an operational change with evidence, version and rollback.


#### Patch Compliance by Fleet Segment

| Category | Compliant (%) | Managed-node coverage (%) |
| --- | --- | --- |
| Web | 96 | 100 |
| Batch | 92 | 98 |
| Database tools | 88 | 91 |
| Legacy | 67 | 72 |

> **Operational note:** Patch compliance cannot exceed managed-node visibility; onboard and inventory the fleet before enforcing targets.


#### Systems Manager Capabilities

| Concept | Explanation |
| --- | --- |
| Session Manager | Auditable shell access without inbound SSH or bastion exposure. |
| Run Command | Execute controlled commands across tagged targets. |
| Patch Manager | Baseline, maintenance window, compliance and remediation. |
| Automation | Runbooks coordinate multi-step operational changes. |


#### Placement Strategies

| Strategy | Optimises | Failure characteristic |
| --- | --- | --- |
| Cluster | Low-latency high-throughput east-west traffic | Single-AZ concentration |
| Spread | Small number of critical instances | Distinct underlying hardware |
| Partition | Large distributed workloads | Partition-aware failure isolation |


#### Safe Fleet Change

| Stage | Operational meaning |
| --- | --- |
| Select | Tags and inventory |
| Canary | One representative node |
| Execute | Controlled concurrency |
| Observe | Health and errors |
| Expand | Waves by risk |
| Rollback | Known-good state |

> **Operational note:** OPERATIONS RULE — Scale the change only after the canary evidence meets the acceptance threshold.


#### Fleet Principle

If a server cannot be identified, accessed, patched and replaced consistently, it is not operationally managed.

> **Operational note:** Use tags, roles, inventory, image pipelines and Systems Manager to turn instances into a governed fleet.

> **Operational note:** Applied in Lab 03 — Operate an EC2 Fleet with Systems Manager.


### Topic 04 — Reliability, Elasticity and High Availability

Alignment: LO1 · K4 · K5 · A3 · A5 · SOA-C03 Domain 2 · 22%. Elastic Load Balancing · Auto Scaling · health checks · containers · graceful degradation

| Key idea | Explanation |
| --- | --- |
| High availability is an end-to-end property | Compute redundancy fails if identity, data or network dependencies remain single points. |
| Elasticity follows demand | Auto Scaling changes capacity using a measurable signal and bounded policy. |
| Health checks drive routing | A check must represent the user's ability to receive a correct response. |
| Resilience requires recovery | Design degradation, retry, failover and rollback before an incident. |


#### Load Balancer Selection

| Type | Layer and strength | Typical workload |
| --- | --- | --- |
| ALB | Layer 7 HTTP routing, host/path rules | Web, APIs and containers |
| NLB | Layer 4 performance and static IP | TCP/UDP/TLS and extreme scale |
| GWLB | Transparent appliance insertion | Firewalls and inspection fleets |


#### Request Path and Health

| Stage | Operational meaning |
| --- | --- |
| DNS | Resolve healthy endpoint |
| Load balancer | Select target |
| Target group | Health and port |
| Application | Dependency-aware response |
| Telemetry | Latency and errors |
| Scaling | Capacity response |

> **Operational note:** TROUBLESHOOTING — Follow the request path in order; do not jump directly to the instance.


#### Scaling Policy Behaviour

| Category | Demand units | Capacity units |
| --- | --- | --- |
| 09:00 | 20 | 30 |
| 10:00 | 45 | 40 |
| 11:00 | 80 | 70 |
| 12:00 | 120 | 120 |
| 13:00 | 70 | 90 |
| 14:00 | 35 | 50 |

> **Operational note:** Target tracking follows demand with delay; warm-up and cooldown prevent unstable oscillation.


#### Auto Scaling Controls

| Concept | Explanation |
| --- | --- |
| Desired capacity | The current fleet target between minimum and maximum bounds. |
| Target tracking | Adjusts capacity to hold a metric near a chosen target. |
| Step scaling | Uses breach magnitude to change capacity by defined steps. |
| Lifecycle hook | Pauses launch or termination for controlled work. |


#### Failure Handling

| Pattern | Response | Caution |
| --- | --- | --- |
| Retry with backoff | Recover from transient dependency failure | Bound attempts and add jitter |
| Circuit breaker | Stop calling an unhealthy dependency | Define recovery probe |
| Bulkhead | Isolate resource pools | Capacity must reflect priority |
| Graceful degradation | Preserve critical function | Communicate reduced service |


#### Container Operations in SOA-C03

ECS / EKS: Service desired count; Task or pod health and placement.

Images: Versioned and scanned; Immutable deployment input.

Observability: Container Insights; Logs, metrics and traces by workload.


#### Availability Test

Redundancy is not resilience until failover is exercised.

> **Operational note:** Measure detection, decision, traffic shift, recovery, data integrity and return to steady state.

> **Operational note:** Applied in Lab 04 — Deploy and Test a Multi-AZ Highly Available Service.


### Topic 05 — Backup, Restore and Business Continuity

Alignment: LO1 · LO4 · K4 · A1 · A4 · A6 · SOA-C03 Domain 2 · 22%. RTO/RPO · AWS Backup · snapshots · replication · pilot light · warm standby

| Key idea | Explanation |
| --- | --- |
| Backup is not recovery | A protected copy has value only when restore time and data integrity are proven. |
| RTO and RPO drive design | Recovery time and acceptable data loss determine technology and cost. |
| Cross-account protection limits blast radius | Separate vault ownership and controls protect against compromised workloads. |
| Continuity is a rehearsed capability | People, runbooks, dependencies and evidence matter as much as replication. |


#### RTO and RPO

| Objective | Question | Design influence |
| --- | --- | --- |
| RTO | How quickly must service return? | Automation, standby capacity and failover |
| RPO | How much recent data may be lost? | Backup frequency and replication |
| Retention | How far back must recovery reach? | Lifecycle, vault and compliance |
| Integrity | How do we know restored data is correct? | Checksums and application validation |


#### Continuity Patterns Trade Cost for Recovery

| Category | Relative steady-state cost | Recovery speed index |
| --- | --- | --- |
| Backup/restore | 1 | 2 |
| Pilot light | 3 | 5 |
| Warm standby | 6 | 8 |
| Active/active | 10 | 10 |

> **Operational note:** Choose the least costly pattern that demonstrably meets business RTO, RPO and compliance requirements.


#### Recovery Assurance Loop

| Stage | Operational meaning |
| --- | --- |
| Classify | Workload and data |
| Protect | Plan and vault |
| Monitor | Job and copy status |
| Restore | Isolated target |
| Validate | Application and data |
| Improve | Gap and owner |

> **Operational note:** A6 EVIDENCE — A completed backup job is an input; a tested restore with measured recovery is evidence.


#### AWS Backup Controls

| Concept | Explanation |
| --- | --- |
| Plan | Schedules, windows, lifecycle and copy actions. |
| Vault | Access policy, encryption and logical separation. |
| Vault Lock | Retention controls designed to resist early deletion. |
| Audit Manager | Evidence against backup policy and compliance frameworks. |


#### Replication Choices

| Mechanism | Strength | Operational concern |
| --- | --- | --- |
| EBS snapshot copy | Point-in-time regional protection | Restore and launch workflow |
| S3 replication | Object-level asynchronous copy | Existing objects and delete markers |
| RDS cross-Region replica | Lower RPO read copy | Promotion and endpoint change |
| DynamoDB global table | Multi-Region active data | Conflict and application behaviour |


#### Continuity Runbook

Decision: Declared trigger and authority; Communication path.

Execution: Dependency order; Automated and manual steps.

Evidence: Timestamps and validation; Actual RTO/RPO and gaps.


#### Recovery Principle

A restore you have not tested is only a hypothesis.

> **Operational note:** Schedule recovery exercises, isolate tests from production, measure actual results and close every gap with an owner.

> **Operational note:** Applied in Lab 06 — Prove Backup and Restore Readiness.


### Topic 06 — Deployment, Provisioning and Automation

Alignment: LO2 · LO4 · K3 · K4 · A4 · A5 · SOA-C03 Domain 3 · 22%. CloudFormation · StackSets · change sets · drift · Systems Manager Automation · Git and IaC

| Key idea | Explanation |
| --- | --- |
| Infrastructure is versioned | Templates and policies create a reviewable desired state. |
| Preview before execution | Change sets reveal creates, replacements and deletions before the stack changes. |
| Drift is a control signal | Difference between desired and actual state requires investigation, not blind overwrite. |
| Automation must be idempotent | Repeated execution should converge safely to the intended state. |


#### Infrastructure Change Path

| Stage | Operational meaning |
| --- | --- |
| Branch | Versioned proposal |
| Validate | Syntax and policy |
| Plan | Change set |
| Approve | Risk and authority |
| Apply | Bounded deployment |
| Verify | State, service and rollback |

> **Operational note:** A5 CONNECTION — The template, plan, approval, execution and verification form one auditable release record.


#### CloudFormation Update Controls

| Control | Purpose | Operational use |
| --- | --- | --- |
| Change set | Preview resource actions | Review replacements and deletions |
| Stack policy | Protect critical resources | Restrict updates during normal change |
| Rollback | Return after failed update | Preserve events for diagnosis |
| Termination protection | Prevent accidental stack deletion | Use on persistent environments |


#### Automation Reduces Configuration Variance

| Category | Configuration variance index | Change evidence score |
| --- | --- | --- |
| Manual | 10 | 2 |
| Scripted | 6 | 5 |
| IaC | 3 | 8 |
| IaC + policy | 1 | 10 |

> **Operational note:** Automation improves consistency; policy and version control make the change explainable and governable.


#### Template Engineering

| Concept | Explanation |
| --- | --- |
| Parameters | Expose safe environment-specific values without duplicating templates. |
| Mappings and conditions | Represent controlled variation, not arbitrary complexity. |
| Outputs and exports | Publish stable integration values with dependency awareness. |
| Deletion and update policies | Protect or snapshot stateful resources during change. |


#### StackSets Deployment Models

| Model | Best fit | Trade-off |
| --- | --- | --- |
| Self-managed | Explicit administration and target roles | More role setup and control |
| Service-managed | AWS Organizations integration | Requires trusted access and OU planning |
| Automatic deployment | New accounts inherit baseline | Test policy and Region scope carefully |


#### Automation Runbook Design

Inputs: Validated parameters; No embedded secrets.

Control: Retries and timeouts; Approval for destructive steps.

Output: Structured evidence; Explicit success and rollback.


#### IaC Discipline

Do not fix drift by hiding it.

> **Operational note:** Identify who changed what and why, decide whether actual or desired state is correct, then reconcile through the controlled source.

> **Operational note:** Applied in Lab 05 — Control Infrastructure Change and Configuration Drift.


### Topic 07 — Security, Identity and Compliance

Alignment: LO2 · LO3 · K1 · K3 · A1 · A7 · SOA-C03 Domain 4 · 16%. IAM · Organizations · KMS · Config · Security Hub · GuardDuty · Inspector · Macie

| Key idea | Explanation |
| --- | --- |
| Identity is the control plane | Short-lived credentials, least privilege and explicit trust bound administrative power. |
| Prevent, detect and respond | Policies prevent known bad states; telemetry detects deviation; runbooks contain and recover. |
| Encryption includes key operations | Access, rotation, grants, aliases and recovery must be governed—not only enabled. |
| Compliance requires evidence | A rule result is useful when linked to scope, owner, remediation and exception process. |


#### Identity Policy Layers

| Layer | What it controls | Common failure |
| --- | --- | --- |
| Identity policy | Permissions granted to a principal | Overbroad action or resource |
| Resource policy | Who may access a resource | Unintended external principal |
| Permission boundary | Maximum identity permissions | Assuming it grants access |
| SCP | Maximum permissions in an organisation | Blocking required service operation |


#### Access Evaluation

| Stage | Operational meaning |
| --- | --- |
| Authenticate | Principal and session |
| Context | Action, resource and conditions |
| Explicit deny | Any matching deny wins |
| Allow | At least one applicable allow |
| Boundary | Maximum permitted set |
| Decision | Allow or deny with evidence |

> **Operational note:** TROUBLESHOOTING — Use CloudTrail, policy simulator and access analysis to explain the decision path.


#### Security Findings Need Prioritisation

| Category | Open findings | SLA hours |
| --- | --- | --- |
| Critical | 3 | 4 |
| High | 14 | 24 |
| Medium | 37 | 120 |
| Low | 82 | 720 |

> **Operational note:** Severity, exposure, asset value and exploitability drive response; high volume alone does not determine priority.


#### Security Services by Question

| Concept | Explanation |
| --- | --- |
| GuardDuty | What suspicious account, workload or network activity is occurring? |
| Inspector | Which compute workloads have vulnerabilities or exposure? |
| Macie | Where is sensitive data in S3 and how is it exposed? |
| Security Hub | How do findings and standards combine across accounts? |


#### KMS Key Choices

| Choice | Operational control | Use carefully |
| --- | --- | --- |
| AWS owned | Service manages lifecycle | Limited customer control |
| AWS managed | Visible service key | Policy is service-oriented |
| Customer managed | Policy, grants, rotation and aliases | Availability and deletion governance |
| Multi-Region key | Related key material across Regions | Application and recovery design |


#### Compliance Remediation

| Stage | Operational meaning |
| --- | --- |
| Define | Required state |
| Evaluate | Config rule or control |
| Prioritise | Risk and scope |
| Remediate | Automation or owner |
| Verify | Compliant state |
| Exception | Approved expiry and review |

> **Operational note:** A7 OUTPUT — Service quality is a measurable standard with evidence, not a one-time checkbox.


#### Security Operations

Least privilege is a lifecycle, not a launch-day setting.

> **Operational note:** Observe actual use, remove unused permissions, constrain trust, investigate denied actions and revalidate after organisational change.

> **Operational note:** Applied in Lab 07 — Build a Multi-Account Compliance Evidence Flow, Lab 08 — Diagnose IAM Access and Protect Data with KMS.


### Topic 08 — Networking, DNS and Content Delivery

Alignment: LO5 · K2 · A2 · SOA-C03 Domain 5 · 18%. VPC · routes · security groups · NACLs · endpoints · Route 53 · CloudFront

| Key idea | Explanation |
| --- | --- |
| Connectivity is a path | DNS, route, policy, state, endpoint and application health must all succeed. |
| Security groups are stateful | Return traffic is automatically allowed; network ACLs evaluate each direction. |
| Private connectivity reduces exposure | VPC endpoints, Transit Gateway and hybrid links change routing and policy boundaries. |
| DNS is a control surface | Routing policy, health evaluation, TTL and resolver behaviour affect recovery. |


#### Connectivity Troubleshooting Order

| Stage | Operational meaning |
| --- | --- |
| Name | DNS answer and TTL |
| Route | Longest prefix and target |
| Policy | SG, NACL and endpoint policy |
| State | NAT, connection and asymmetric path |
| Target | Listener, port and health |
| Evidence | Flow logs and application logs |

> **Operational note:** A2 STANDARD — Test from source to destination and record the first failed control boundary.


#### Security Group vs Network ACL

| Property | Security group | Network ACL |
| --- | --- | --- |
| Scope | Elastic network interface | Subnet |
| State | Stateful | Stateless |
| Rules | Allow only | Numbered allow and deny |
| Evaluation | All rules together | Lowest rule number first |


#### DNS TTL Trades Agility for Query Load

| Category | Failover agility index | Resolver query load index |
| --- | --- | --- |
| 30 sec | 10 | 10 |
| 60 sec | 8 | 7 |
| 300 sec | 4 | 3 |
| 900 sec | 2 | 1 |

> **Operational note:** Lower TTL can speed client refresh but increases query volume and cannot force every resolver to behave identically.


#### Route 53 Routing Policies

| Concept | Explanation |
| --- | --- |
| Simple | One or more values without health-based policy logic. |
| Weighted | Controlled traffic split for migration or experiments. |
| Latency | Direct users to the Region with lowest measured latency. |
| Failover | Primary and secondary routing driven by health. |


#### VPC Endpoint Types

| Endpoint | Connectivity | Common use |
| --- | --- | --- |
| Gateway | Route-table target | S3 and DynamoDB |
| Interface | Private IP through PrivateLink | Many AWS and partner services |
| Gateway Load Balancer | Inspection appliance insertion | Central security services |
| Resource / service network | VPC Lattice private application access | Cross-VPC service connectivity |


#### CloudFront Operations

Cache: Cache key and TTL; Invalidation and versioned objects.

Origin: Origin access control; Origin health and failover.

Security: TLS certificate and WAF; Logs and real-time metrics.


#### Network Diagnosis

A timeout is a symptom, not a location.

> **Operational note:** Use DNS results, route tables, reachability analysis, flow logs, load-balancer health and application evidence to isolate the boundary.

> **Operational note:** Applied in Lab 09 — Troubleshoot a VPC Connectivity Path, Lab 10 — Operate DNS and Content-Delivery Failover.


### Topic 09 — Storage, Data and Database Operations

Alignment: LO1 · LO2 · LO4 · K1 · K4 · A1 · A4 · A6 · Cross-domain operations. S3 · EBS · EFS · RDS · DynamoDB · lifecycle · performance · data protection

| Key idea | Explanation |
| --- | --- |
| Choose by access pattern | Object, block, file and database services solve different consistency, latency and sharing needs. |
| Performance has service-specific limits | IOPS, throughput, connections, partitions and caching require different evidence. |
| Data protection is layered | Encryption, versioning, snapshots, backup and replication address different risks. |
| Managed does not mean unmanaged | Customers still own schema, configuration, access, capacity and recovery choices. |


#### Storage Selection

| Service | Access model | Operational fit |
| --- | --- | --- |
| S3 | Object and API | Durable data lake, backup and static content |
| EBS | Block device to compute | Low-latency instance and database volumes |
| EFS | Shared NFS file system | Elastic multi-instance Linux file access |
| FSx | Managed specialised file system | Windows, Lustre, NetApp or OpenZFS workloads |


#### S3 Data Protection

| Stage | Operational meaning |
| --- | --- |
| Block | Public access controls |
| Authorise | Identity and bucket policy |
| Encrypt | Default SSE and KMS |
| Version | Recover overwrite or delete |
| Lifecycle | Transition and expire |
| Replicate | Account or Region copy |

> **Operational note:** A1 CONNECTION — Protection combines preventive access, recoverability, retention and evidence.


#### EBS Performance Must Match Workload

| Category | Relative IOPS | Relative throughput |
| --- | --- | --- |
| gp3 baseline | 3 | 3 |
| gp3 tuned | 8 | 6 |
| io2 | 10 | 5 |
| st1 | 1 | 10 |

> **Operational note:** IOPS and throughput are different dimensions; select volume type and configuration from measured workload behaviour.


#### RDS Availability and Scale

| Feature | Primary goal | Operational note |
| --- | --- | --- |
| Multi-AZ | Availability and failover | Standby is not a read-scaling target |
| Read replica | Read scale and reporting | Replication lag and promotion plan |
| Automated backup | Point-in-time recovery | Retention and restore testing |
| RDS Proxy | Connection pooling and resilience | Application compatibility and limits |


#### DynamoDB Operations

| Concept | Explanation |
| --- | --- |
| Capacity | On-demand or provisioned with auto scaling and adaptive capacity. |
| Partition key | Distribute traffic; avoid hot keys and unbounded item growth. |
| Recovery | Point-in-time recovery, on-demand backup and restore. |
| Global table | Multi-Region active access with application-aware conflict behaviour. |


#### Database Incident Evidence

Resource: CPU, memory and storage; Connections and queue depth.

Engine: Slow queries and locks; Wait events and plans.

Change: Configuration and schema history; Deployment and failover events.


#### Data Operations

Durability claims do not replace recovery design.

> **Operational note:** Protect the correct scope, control access, monitor jobs, test restore, validate application behaviour and measure actual RTO/RPO.

> **Operational note:** Applied in Lab 11 — Diagnose Storage and Database Performance, Then Recover.


### Topic 10 — Performance, Cost and Integrated Troubleshooting

Alignment: LO3 · LO4 · LO5 · K2 · K4 · A2 · A4 · A7 · Integration across SOA-C03 domains. Bottleneck analysis · Cost Explorer · Trusted Advisor · runbooks · game days · capstone

| Key idea | Explanation |
| --- | --- |
| Optimise after measurement | Right-size and tune using utilisation, saturation, latency and business demand. |
| Cost anomalies are operational signals | Unexpected spend can reveal leakage, misconfiguration, attack or failed cleanup. |
| Troubleshoot hypotheses | A runbook narrows evidence systematically instead of changing multiple variables. |
| Service quality is verified | SLOs, recovery tests and post-incident actions prove operational capability. |


#### Evidence-Led Troubleshooting

| Stage | Operational meaning |
| --- | --- |
| Frame | Impact, scope and time |
| Baseline | Expected behaviour |
| Correlate | Signals and recent change |
| Hypothesise | Ranked possible causes |
| Test | One safe discriminating action |
| Verify | Outcome and recurrence control |

> **Operational note:** A4 STANDARD — A hypothesis is not a cause until evidence supports it and alternatives are tested.


#### Performance Signals

| Signal | Interpretation | Example action |
| --- | --- | --- |
| Utilisation | Resource use relative to capacity | Right-size only with sustained evidence |
| Saturation | Queued work or constrained resource | Increase capacity or remove bottleneck |
| Errors | Failed operations or retries | Trace dependency and change history |
| Latency | Time experienced by request | Inspect percentiles and request path |


#### Cost Anomaly Investigation

| Category | Baseline daily cost | Observed daily cost |
| --- | --- | --- |
| Compute | 220 | 235 |
| Storage | 90 | 92 |
| Data transfer | 45 | 180 |
| Database | 130 | 135 |
| Logging | 25 | 70 |

> **Operational note:** The largest percentage changes are data transfer and logging; investigate traffic path, retention and recent configuration before right-sizing compute.


#### Cost and Optimisation Tools

| Concept | Explanation |
| --- | --- |
| Cost Explorer | Trend, filter, group and forecast historical spend. |
| Cost Anomaly Detection | Surface spend patterns that deviate from expected behaviour. |
| Compute Optimizer | Resource recommendations from utilisation history. |
| Trusted Advisor | Checks across cost, security, resilience, performance and limits. |


#### Runbook vs Playbook

| Artifact | Purpose | Contents |
| --- | --- | --- |
| Runbook | Repeatable technical procedure | Inputs, steps, verification and rollback |
| Playbook | Coordinated response to a scenario | Roles, decisions, communication and runbooks |
| Game day | Exercise assumptions safely | Scenario, injects, observations and improvements |
| Post-incident review | Prevent recurrence | Timeline, causes, actions and verification |


#### Service Quality Review

Reliability: SLO and error budget; Recovery test results.

Security: Findings and exceptions; Control effectiveness.

Efficiency: Capacity and cost; Automation and toil reduction.


#### Capstone Standard

Restore service, explain the evidence, and improve the system.

> **Operational note:** A complete CloudOps response connects detection, diagnosis, controlled recovery, validation, communication and recurrence prevention.

> **Operational note:** Applied in Lab 12 — Capstone — Resolve a Multi-Service CloudOps Incident.


## Detailed AWS Lab Guides


### Lab 01 — Build an Observability and Incident Detection Baseline

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 1 · Topic 02 |
| Objective | Apply K1, K3, K4, A1 and A4 by creating a dashboard, alarm, CloudTrail evidence query and EventBridge detection rule for one tagged workload. |
| Scenario | Northstar Retail has intermittent web latency but no agreed baseline, owner or repeatable incident-evidence process. |
| Deliverable | A CloudWatch dashboard, alarm definition, EventBridge pattern, evidence log and validation screenshots. |
| Services | CloudWatch · CloudTrail · EventBridge · SNS · AWS CLI · CloudShell |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Open `LAB-PLAN.md`; record the assigned Region, workload tag, notification email and cost boundary before creating resources.
```bash
open LAB-PLAN.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Confirm the active identity and Region in CloudShell. Save the output in `evidence/caller-identity.txt`.
```bash
aws sts get-caller-identity | tee evidence/caller-identity.txt
aws configure get region | tee evidence/region.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Create or select a small tagged EC2 training workload and confirm the `Course=TGS-2024051413` tag is visible.
```bash
aws ec2 describe-instances --filters 'Name=tag:Course,Values=TGS-2024051413' --query 'Reservations[].Instances[].{Id:InstanceId,State:State.Name,AZ:Placement.AvailabilityZone}' --output table
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Replace the placeholder instance ID in `cloudwatch-dashboard.json`, then create the dashboard.
```bash
aws cloudwatch put-dashboard --dashboard-name SysOps-Lab01 --dashboard-body file://cloudwatch-dashboard.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Replace the placeholder values in `alarm.json`; create the CPU alarm and verify its current state.
```bash
aws cloudwatch put-metric-alarm --cli-input-json file://alarm.json
aws cloudwatch describe-alarms --alarm-names SysOps-Lab01-HighCPU
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Review CloudTrail Event history for your identity and export recent management events.
```bash
aws cloudtrail lookup-events --max-results 20 --query 'Events[].{Time:EventTime,Name:EventName,User:Username}' --output table | tee evidence/cloudtrail-events.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Create the EventBridge rule from `event-pattern.json`; add the trainer-approved SNS target only after subscription confirmation.
```bash
aws events put-rule --name SysOps-Lab01-ConsoleChange --event-pattern file://event-pattern.json --state ENABLED
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Generate one safe configuration event, locate it in CloudTrail and confirm the EventBridge rule metric changes.
```bash
aws events describe-rule --name SysOps-Lab01-ConsoleChange | tee evidence/event-rule.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Complete `INCIDENT-EVIDENCE.md`: separate observation, hypothesis, impact, next test and owner.
```bash
open INCIDENT-EVIDENCE.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Capture the dashboard, alarm and event rule as JPEG screenshots; compare them with `EXPECTED-ARCHITECTURE.jpg`.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

11. Run `validate.sh`; resolve missing placeholders or evidence before cleanup.
```bash
bash validate.sh
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

12. Delete the lab rule, alarm and dashboard unless the trainer approves reuse; record cleanup evidence.
```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The dashboard and alarm reference the assigned workload; CloudTrail evidence names the actor and event; the EventBridge pattern is valid; the incident record distinguishes observation from hypothesis; validation emits LAB 01 PASS.


#### Evidence to retain

- Dashboard JPEG
- Alarm JPEG
- CloudTrail event export
- EventBridge rule export
- completed INCIDENT-EVIDENCE.md
- cleanup.txt


#### Acceptance criteria

- No placeholder values remain
- All resources carry the course tag where supported
- Alarm has an owner and action
- Evidence includes UTC timestamps
- No unapproved paid resource remains


### Lab 02 — Automate Event-Driven Incident Triage

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 1 · Topic 02 |
| Objective | Apply K3, K4, A1 and A4 by routing a controlled AWS event through EventBridge, invoking a least-privilege remediation function and preserving an auditable triage record. |
| Scenario | Northstar Retail needs to detect an unapproved security-group change quickly, enrich the event and notify the operator without making an unsafe automatic network change. |
| Deliverable | An EventBridge rule, Lambda triage function, test event, CloudWatch Logs evidence and incident decision record. |
| Services | EventBridge · Lambda · CloudTrail · CloudWatch Logs · IAM |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review the architecture JPEG and `event-pattern.json`; identify event source, API names, principal context and target.
```bash
python3 -m json.tool event-pattern.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Inspect `triage.py`; confirm it records event identity and never modifies the security group.
```bash
python3 -m py_compile triage.py
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Create the trainer-approved execution role from `lambda-role-policy.json`; replace only the account-specific trust and resource values.
```bash
python3 -m json.tool lambda-role-policy.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Package and create the Lambda function with a unique learner suffix.
```bash
zip -j triage.zip triage.py
aws lambda create-function --function-name SysOps-Lab02-Triage-REPLACE_SUFFIX --runtime python3.13 --handler triage.handler --zip-file fileb://triage.zip --role REPLACE_ROLE_ARN
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Create the EventBridge rule and add the Lambda target; grant EventBridge permission to invoke only this function.
```bash
aws events put-rule --name SysOps-Lab02-SGChange --event-pattern file://event-pattern.json --state ENABLED
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Invoke the function with `test-event.json`; save the response and locate the matching CloudWatch Logs event.
```bash
aws lambda invoke --function-name SysOps-Lab02-Triage-REPLACE_SUFFIX --payload fileb://test-event.json evidence/invoke-response.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Generate one trainer-approved learner-owned security-group change, then verify the real event arrives through EventBridge.
```bash
aws logs tail /aws/lambda/SysOps-Lab02-Triage-REPLACE_SUFFIX --since 10m | tee evidence/triage-log.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Complete `TRIAGE-DECISION.md`: impact, evidence, safe next action, authority, verification and escalation.
```bash
open TRIAGE-DECISION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture EventBridge rule, Lambda monitor and log evidence as JPEG screenshots.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Run validation; delete the rule, target, permission, function and learner-owned test change.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The test and real events reach the Lambda target, logs contain the event ID and actor context, no automatic network modification occurs, the decision record names authority and verification, and validation emits LAB 02 PASS.


#### Evidence to retain

- EventBridge rule export
- Lambda invocation response
- CloudWatch Logs export
- JPEG screenshots
- completed TRIAGE-DECISION.md
- cleanup.txt


#### Acceptance criteria

- Event pattern is limited to named API calls
- Lambda role is least privilege
- Function performs triage only
- Event ID and UTC time are preserved
- Cleanup removes all learner-created automation


### Lab 03 — Operate an EC2 Fleet with Systems Manager

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 1 · Topic 03 |
| Objective | Apply K3, K5, A3 and A5 by onboarding a managed node, using Session Manager and Run Command, assessing patch compliance and executing a controlled Automation runbook. |
| Scenario | Northstar Retail must remove public SSH access and make patching repeatable across tagged web instances. |
| Deliverable | An EC2 managed node, SSM document, patch-compliance report, automation execution record and rollback evidence. |
| Services | EC2 · IAM · Systems Manager · Session Manager · Run Command · Patch Manager · Automation |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review `managed-instance.yaml`; choose the trainer-provided VPC/subnet and confirm the AMI is supported in the assigned Region.
```bash
aws cloudformation validate-template --template-body file://managed-instance.yaml
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Deploy the stack using a unique learner suffix and the required IAM capability.
```bash
aws cloudformation deploy --stack-name SysOps-Lab03-REPLACE_SUFFIX --template-file managed-instance.yaml --capabilities CAPABILITY_NAMED_IAM --parameter-overrides CourseTag=TGS-2024051413
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Obtain the instance ID from stack outputs and wait until Systems Manager reports it online.
```bash
aws ssm describe-instance-information --filters Key=tag:Course,Values=TGS-2024051413 --output table | tee evidence/managed-nodes.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Start a Session Manager session. Confirm there is no inbound SSH rule and capture the managed shell evidence.
```bash
aws ssm start-session --target REPLACE_INSTANCE_ID
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Create the custom SSM document from `document-install-healthcheck.yml` and inspect its status.
```bash
aws ssm create-document --name SysOps-Lab03-HealthCheck --document-type Command --document-format YAML --content file://document-install-healthcheck.yml
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Run the document against the managed node with a concurrency of one and record the command ID.
```bash
aws ssm send-command --document-name SysOps-Lab03-HealthCheck --targets Key=tag:Course,Values=TGS-2024051413 --max-concurrency 1 --max-errors 0 | tee evidence/send-command.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Review Inventory and patch compliance. Explain the baseline, severity and approval rules in `CHANGE-RECORD.md`.
```bash
aws ssm list-compliance-items --resource-ids REPLACE_INSTANCE_ID --resource-types ManagedInstance --output table | tee evidence/compliance.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Execute the read-only Automation runbook and save the output. Do not scale beyond one node until its evidence passes.
```bash
aws ssm start-automation-execution --document-name AWS-DescribeInstanceInformation --parameters InstanceIds=REPLACE_INSTANCE_ID | tee evidence/automation.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture Fleet Manager, compliance and command output as JPEG evidence; compare with `EXPECTED-ARCHITECTURE.jpg`.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Complete the change record with risk, owner, success metric, rollback and UTC timestamps.
```bash
open CHANGE-RECORD.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

11. Run `validate.sh`, then remove the custom document and CloudFormation stack.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The instance is managed without public SSH, the custom document validates, command and compliance evidence are present, the change record includes verification and rollback, and validation emits LAB 03 PASS.


#### Evidence to retain

- Managed-node inventory
- Session Manager JPEG
- Run Command output
- Patch compliance export
- Automation execution
- completed CHANGE-RECORD.md
- cleanup.txt


#### Acceptance criteria

- No inbound SSH from the internet
- Instance profile grants only required managed-node permissions
- Canary concurrency is one
- Patch status is explained
- Rollback and cleanup are documented


### Lab 04 — Deploy and Test a Multi-AZ Highly Available Service

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 1 · Topic 04 |
| Objective | Apply K4, K5, A3 and A5 by deploying an ALB and Auto Scaling service across two Availability Zones, testing health-based recovery and recording a controlled change. |
| Scenario | Northstar Retail's single-instance web service cannot survive an instance or Availability Zone disruption. |
| Deliverable | A two-AZ VPC web tier, ALB, target group, launch template, Auto Scaling group, failover evidence and cleanup record. |
| Services | VPC · EC2 · ALB · Auto Scaling · CloudWatch · CloudFormation |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review `ha-web-stack.yaml` and the architecture JPEG. Identify the two failure domains, health-check path, minimum capacity and rollback boundary.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Validate the template and deploy it with a unique suffix.
```bash
aws cloudformation validate-template --template-body file://ha-web-stack.yaml
aws cloudformation deploy --stack-name SysOps-Lab04-REPLACE_SUFFIX --template-file ha-web-stack.yaml --capabilities CAPABILITY_NAMED_IAM
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Read the stack outputs; save the ALB URL, target group and Auto Scaling group identifiers.
```bash
aws cloudformation describe-stacks --stack-name SysOps-Lab04-REPLACE_SUFFIX --query 'Stacks[0].Outputs' --output table | tee evidence/stack-outputs.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Open the ALB URL repeatedly and confirm both Availability Zones contain healthy targets.
```bash
aws elbv2 describe-target-health --target-group-arn REPLACE_TARGET_GROUP_ARN --output table | tee evidence/target-health-before.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Inspect desired, minimum and maximum capacity. Confirm the group is configured across two subnets.
```bash
aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names REPLACE_ASG_NAME --output json | tee evidence/asg-before.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Run the bounded failure test by terminating one learner-owned instance in the Auto Scaling group; record the UTC start time and change ID.
```bash
aws ec2 terminate-instances --instance-ids REPLACE_CANARY_INSTANCE_ID | tee evidence/termination.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Observe target health, replacement activity and ALB availability until desired capacity and health recover.
```bash
bash failover-observe.sh REPLACE_ASG_NAME REPLACE_TARGET_GROUP_ARN | tee evidence/failover-observation.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Calculate detection and recovery time in `FAILOVER-REPORT.md`; explain whether the observed result meets the stated objective.
```bash
open FAILOVER-REPORT.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Create the target-tracking policy from `scaling-policy.json` only if the trainer approves a scaling demonstration.
```bash
aws autoscaling put-scaling-policy --cli-input-json file://scaling-policy.json | tee evidence/scaling-policy.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Capture ALB health, Auto Scaling activity and CloudWatch signals as JPEG evidence.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

11. Run validation, delete the stack and wait for DELETE_COMPLETE before leaving the lab.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The service spans two Availability Zones, returns a healthy response during one-instance replacement, recovers desired capacity, records measured recovery time, and validation emits LAB 04 PASS.


#### Evidence to retain

- Stack outputs
- Target health before/after
- Auto Scaling activity
- ALB response JPEG
- completed FAILOVER-REPORT.md
- cleanup.txt


#### Acceptance criteria

- Two distinct Availability Zones
- Minimum and desired capacity at least two
- Health check represents application response
- Failure test affects only learner-owned canary
- Measured recovery and rollback are documented


### Lab 05 — Control Infrastructure Change and Configuration Drift

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 2 · Topic 06 |
| Objective | Apply K3, K4, A4 and A5 by validating a CloudFormation template, reviewing a change set, detecting drift and using a Systems Manager Automation runbook with verification. |
| Scenario | A manual console change has made Northstar Retail's production-like environment differ from its approved template. |
| Deliverable | A validated CloudFormation stack, reviewed change set, drift report, reconciliation decision, Automation verification and cleanup record. |
| Services | CloudFormation · Change Sets · Drift Detection · Systems Manager Automation · AWS CLI |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Validate `operations-stack.yaml` locally and with CloudFormation; inspect parameters, tags, deletion policy and output.
```bash
aws cloudformation validate-template --template-body file://operations-stack.yaml | tee evidence/template-validation.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Deploy the baseline stack and record its stack ID and output.
```bash
aws cloudformation deploy --stack-name SysOps-Lab05-REPLACE_SUFFIX --template-file operations-stack.yaml --parameter-overrides Environment=lab
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Edit only the working copy as instructed, then create—not execute—the change set.
```bash
aws cloudformation create-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange --template-body file://operations-stack.yaml --change-set-type UPDATE --parameters ParameterKey=Environment,ParameterValue=lab | tee evidence/change-set-create.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Describe the change set. Record every Add, Modify, Remove or Replacement action in `CHANGE-DECISION.md`.
```bash
aws cloudformation describe-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange | tee evidence/change-set-review.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Execute the trainer-approved change set and wait for UPDATE_COMPLETE.
```bash
aws cloudformation execute-change-set --stack-name SysOps-Lab05-REPLACE_SUFFIX --change-set-name Lab05-ReviewedChange
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Create one safe manual tag drift on the learner-owned resource; record actor and UTC time.
```bash
aws s3api put-bucket-tagging --bucket REPLACE_BUCKET --tagging 'TagSet=[{Key=Course,Value=TGS-2024051413},{Key=DriftDemo,Value=manual}]'
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Start stack drift detection, wait for completion and export the resource drift detail.
```bash
aws cloudformation detect-stack-drift --stack-name SysOps-Lab05-REPLACE_SUFFIX | tee evidence/drift-detection.json
aws cloudformation describe-stack-resource-drifts --stack-name SysOps-Lab05-REPLACE_SUFFIX | tee evidence/drift-details.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Decide whether desired or actual state is correct. Reconcile through the template rather than hiding the drift.
```bash
open CHANGE-DECISION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Create and execute `automation-runbook.yaml` against the learner-owned bucket; save the execution output.
```bash
aws ssm create-document --name SysOps-Lab05-VerifyBucket --document-type Automation --document-format YAML --content file://automation-runbook.yaml
aws ssm start-automation-execution --document-name SysOps-Lab05-VerifyBucket --parameters BucketName=REPLACE_BUCKET | tee evidence/automation.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Capture change-set and drift evidence as JPEG screenshots, run validation, then clean up.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The change set is reviewed before execution, drift evidence identifies the changed property, the decision record explains reconciliation, the Automation runbook verifies state, and validation emits LAB 05 PASS.


#### Evidence to retain

- Template validation
- Change-set review
- Drift details
- Automation execution
- completed CHANGE-DECISION.md
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- No direct unreviewed production-style change
- Replacement actions explicitly reviewed
- Manual drift is confined to learner-owned resource
- Reconciliation decision cites evidence
- Automation has bounded permissions and explicit output


### Lab 06 — Prove Backup and Restore Readiness

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 2 · Topic 05 |
| Objective | Apply K4, A1, A4 and A6 by protecting an S3/EBS-style workload, restoring into isolation and measuring actual recovery evidence. |
| Scenario | Northstar Retail reports successful backup jobs but has never proven that the protected data can be restored within its business objectives. |
| Deliverable | A backup plan, selection, restore checklist, recovery evidence and measured RTO/RPO report. |
| Services | AWS Backup · S3 · EBS · KMS · CloudWatch Events |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Read `RECOVERY-OBJECTIVES.md`; agree the workload scope, RTO, RPO, retention and restore-validation method.
```bash
open RECOVERY-OBJECTIVES.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Validate `backup-plan.json` and replace the learner-specific vault and role values.
```bash
python3 -m json.tool backup-plan.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Create the backup vault and plan with the trainer-approved encryption key and retention.
```bash
aws backup create-backup-vault --backup-vault-name SysOps-Lab06-REPLACE_SUFFIX
aws backup create-backup-plan --backup-plan file://backup-plan.json | tee evidence/backup-plan.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Create the resource selection from `backup-selection.json`; target only resources tagged for this course.
```bash
aws backup create-backup-selection --backup-plan-id REPLACE_PLAN_ID --backup-selection file://backup-selection.json | tee evidence/selection.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Start an on-demand backup and record start/completion times, recovery-point ARN and status.
```bash
aws backup start-backup-job --backup-vault-name SysOps-Lab06-REPLACE_SUFFIX --resource-arn REPLACE_RESOURCE_ARN --iam-role-arn REPLACE_BACKUP_ROLE_ARN | tee evidence/backup-job.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Restore to an isolated learner-owned target; never overwrite the original resource.
```bash
aws backup start-restore-job --recovery-point-arn REPLACE_RECOVERY_POINT_ARN --iam-role-arn REPLACE_RESTORE_ROLE_ARN --metadata file://restore-metadata.json | tee evidence/restore-job.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Validate restored object count, checksum or application-readable state; record the exact method and result.
```bash
shasum -a 256 sample-data.txt | tee evidence/source-checksum.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Complete `RECOVERY-REPORT.md` with actual RTO, observed RPO, integrity result, gaps and owners.
```bash
open RECOVERY-REPORT.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture backup and restore job status as JPEG evidence and compare with the architecture reference.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Run validation; remove the restored target and learner-created plan after retention/permission checks.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

A completed recovery point is restored to an isolated target, integrity is checked, actual recovery is compared with RTO/RPO, gaps have owners, and validation emits LAB 06 PASS.


#### Evidence to retain

- Backup plan and selection
- Backup job
- Restore job
- checksum evidence
- completed RECOVERY-REPORT.md
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- Scope uses course tags
- Restore target is isolated
- Retention is explicit
- Integrity validation is objective
- Actual RTO/RPO and gaps are recorded


### Lab 07 — Build a Multi-Account Compliance Evidence Flow

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 2 · Topic 07 |
| Objective | Apply K1, K3, A1 and A7 by evaluating required tags and encryption, aggregating findings and documenting a controlled remediation exception. |
| Scenario | Northstar Retail cannot demonstrate consistent security and service-quality controls across its training accounts. |
| Deliverable | A Config rule template, tag policy, findings register, remediation decision and service-quality scorecard. |
| Services | AWS Config · Organizations · Security Hub · EventBridge · Systems Manager Automation |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review the required state in `QUALITY-STANDARD.md`; define scope, evidence, owner, remediation SLA and exception expiry.
```bash
open QUALITY-STANDARD.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Validate `config-controls.yaml` and `tag-policy.json`; replace the approved delivery channel and organisation values.
```bash
aws cloudformation validate-template --template-body file://config-controls.yaml
python3 -m json.tool tag-policy.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Deploy the Config controls in the learner account and record the recorder and delivery status.
```bash
aws cloudformation deploy --stack-name SysOps-Lab07-REPLACE_SUFFIX --template-file config-controls.yaml --capabilities CAPABILITY_NAMED_IAM
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Create one compliant and one intentionally noncompliant learner-owned test resource.
```bash
aws resourcegroupstaggingapi get-resources --tag-filters Key=Course,Values=TGS-2024051413 | tee evidence/tagged-resources.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Run rule evaluation and export compliant/noncompliant resources with timestamps.
```bash
aws configservice get-compliance-details-by-config-rule --config-rule-name required-tags | tee evidence/config-findings.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Review `sample-security-findings.json`; prioritise by severity, exposure, asset and exploitability—not count alone.
```bash
python3 -m json.tool sample-security-findings.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Complete `REMEDIATION-REGISTER.csv` with owner, due date, chosen automation and verification.
```bash
open REMEDIATION-REGISTER.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Document one time-bound exception with business owner, compensating control and expiry.
```bash
open EXCEPTION-RECORD.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture Config compliance and finding summary as JPEG evidence; run validation.
```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Remove intentional noncompliance and delete learner-created controls; retain the evidence files.
```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

Required controls evaluate learner-owned resources, findings are prioritised with context, remediation has owner/SLA/verification, the exception expires, and validation emits LAB 07 PASS.


#### Evidence to retain

- Config findings
- tagged resources export
- completed remediation register
- exception record
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- Scope and standard are explicit
- Every finding has an owner
- Exception has compensating control and expiry
- Verification proves compliant state
- Intentional noncompliance is removed


### Lab 08 — Diagnose IAM Access and Protect Data with KMS

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 2 · Topic 07 |
| Objective | Apply K1, K3, A1 and A7 by explaining an access decision, narrowing permissions and verifying encryption and key-policy behaviour. |
| Scenario | A learner workload is denied access to an encrypted object after a policy change, while an earlier role remains broader than required. |
| Deliverable | A policy-evaluation worksheet, corrected least-privilege policy, KMS key-policy review and encrypted-object evidence. |
| Services | IAM · Access Analyzer · Policy Simulator · KMS · S3 · CloudTrail |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Read `ACCESS-SCENARIO.md`; identify principal, action, resource, conditions, boundary and possible explicit denies.
```bash
open ACCESS-SCENARIO.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Validate the supplied identity, bucket and KMS policy JSON before reasoning about the decision.
```bash
for f in identity-policy.json bucket-policy.json kms-key-policy.json; do python3 -m json.tool "$f" >/dev/null; done
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Use the IAM policy simulator or trainer-provided equivalent to test GetObject on the exact learner object ARN.
```bash
aws iam simulate-principal-policy --policy-source-arn REPLACE_ROLE_ARN --action-names s3:GetObject kms:Decrypt --resource-arns REPLACE_OBJECT_ARN REPLACE_KEY_ARN | tee evidence/simulation.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Inspect CloudTrail for the denied request and record error code, principal, resource and UTC time.
```bash
aws cloudtrail lookup-events --lookup-attributes AttributeKey=EventName,AttributeValue=GetObject --max-results 20 | tee evidence/cloudtrail-deny.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Complete `ACCESS-DECISION.md` in evaluation order; distinguish the S3 allow from the KMS decrypt requirement.
```bash
open ACCESS-DECISION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Edit `identity-policy.json` to the exact bucket prefix and key; retain no wildcard action.
```bash
open identity-policy.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Upload and retrieve a small encrypted learner-owned object, then verify encryption metadata.
```bash
aws s3api head-object --bucket REPLACE_BUCKET --key lab08/evidence.txt | tee evidence/head-object.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Run Access Analyzer validation on the policies and resolve ERROR findings.
```bash
aws accessanalyzer validate-policy --policy-document file://identity-policy.json --policy-type IDENTITY_POLICY | tee evidence/policy-validation.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture policy simulation and encrypted-object evidence as JPEG screenshots; run validation.
```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Remove the learner test object and any temporary role/policy; do not schedule KMS key deletion without trainer approval.
```bash
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The decision path explains the deny, corrected policy uses exact actions/resources, encrypted-object metadata is verified, Access Analyzer reports no ERROR, and validation emits LAB 08 PASS.


#### Evidence to retain

- Policy simulation
- CloudTrail denied event
- policy validation
- encrypted object metadata
- completed ACCESS-DECISION.md
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- No wildcard action
- Resource scope is exact
- KMS and S3 permissions both considered
- Explicit deny precedence explained
- Temporary access is removed


### Lab 09 — Troubleshoot a VPC Connectivity Path

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 3 · Topic 08 |
| Objective | Apply K2 and A2 by isolating a failed request through DNS, routes, security groups, network ACLs, target health and VPC Flow Logs. |
| Scenario | A private application instance is healthy locally but cannot reach an approved service endpoint after a network change. |
| Deliverable | A VPC diagnostic worksheet, reachability/flow-log evidence, corrected network control and before/after result. |
| Services | VPC · Reachability Analyzer · Flow Logs · Security Groups · NACLs · Endpoints |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review `PATH-DIAGRAM.md`; write source, destination, protocol, port, expected route and success response.
```bash
open PATH-DIAGRAM.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Run `diagnostics.sh` with the learner source and destination; retain every command result even when it fails.
```bash
bash diagnostics.sh REPLACE_SOURCE_ENI REPLACE_DESTINATION_IP | tee evidence/diagnostics.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Confirm DNS resolution and compare the returned address with the intended private/public path.
```bash
dig +short REPLACE_HOSTNAME | tee evidence/dns.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Inspect source and destination subnet route tables using longest-prefix-match reasoning.
```bash
aws ec2 describe-route-tables --filters Name=association.subnet-id,Values=REPLACE_SUBNET_ID | tee evidence/routes.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Inspect security-group rules in both directions and state whether return traffic is automatically allowed.
```bash
aws ec2 describe-security-groups --group-ids REPLACE_SG_ID | tee evidence/security-group.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Inspect network ACL rules by number in both directions, including ephemeral return ports.
```bash
aws ec2 describe-network-acls --filters Name=association.subnet-id,Values=REPLACE_SUBNET_ID | tee evidence/nacl.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Create or run Reachability Analyzer where supported and record the first blocking component.
```bash
aws ec2 start-network-insights-analysis --network-insights-path-id REPLACE_PATH_ID | tee evidence/reachability.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Query Flow Logs for ACCEPT/REJECT evidence correlated to source, destination, port and UTC time.
```bash
open FLOW-LOG-QUERY.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Change only the identified learner-owned control; repeat the same test and record before/after evidence.
```bash
open DIAGNOSTIC-REPORT.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Capture route, rule and result as JPEG evidence; run validation and restore temporary changes.
```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

The report follows the path in order, names the first failed boundary with evidence, changes one learner-owned control, verifies success with the same test, and validation emits LAB 09 PASS.


#### Evidence to retain

- DNS result
- route tables
- security-group and NACL exports
- reachability analysis
- Flow Log query
- completed diagnostic report
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- Source/destination/protocol/port explicit
- Route and policy evaluated separately
- Stateful/stateless return path explained
- One variable changed
- Before/after test is identical


### Lab 10 — Operate DNS and Content-Delivery Failover

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 3 · Topic 08 |
| Objective | Apply K2 and A2 by configuring health-aware DNS and CloudFront behaviour, then proving client-visible routing and cache outcomes. |
| Scenario | Northstar Retail needs a controlled failover path for a public web endpoint and must distinguish DNS, origin and cache effects during an incident. |
| Deliverable | A Route 53 health-check definition, failover record plan, CloudFront operations checklist and measured failover report. |
| Services | Route 53 · Health Checks · CloudFront · S3 · CloudWatch |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Review `DNS-FAILOVER-PLAN.md`; record hosted zone, primary/secondary endpoints, TTL, health criteria and rollback authority.
```bash
open DNS-FAILOVER-PLAN.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Validate `health-check.json`; replace the trainer-provided test endpoint and unique caller reference.
```bash
python3 -m json.tool health-check.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Create the health check and confirm CloudWatch health status before associating any record.
```bash
aws route53 create-health-check --caller-reference SysOps-Lab10-REPLACE_SUFFIX --health-check-config file://health-check.json | tee evidence/health-check.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Review `failover-records.json`; confirm PRIMARY and SECONDARY identifiers, evaluate-target-health setting and TTL.
```bash
python3 -m json.tool failover-records.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Apply the trainer-approved learner-zone record change and record the change ID.
```bash
aws route53 change-resource-record-sets --hosted-zone-id REPLACE_ZONE_ID --change-batch file://failover-records.json | tee evidence/record-change.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Query the name repeatedly from two resolvers; record answers and TTL before failure injection.
```bash
for n in {1..5}; do date -u +%FT%TZ; dig +noall +answer REPLACE_NAME; sleep 5; done | tee evidence/dns-before.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Run the bounded primary failure approved by the trainer; measure health-check change and client answer transition.
```bash
for n in {1..20}; do date -u +%FT%TZ; dig +short REPLACE_NAME; sleep 10; done | tee evidence/dns-failover.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Inspect CloudFront response headers for cache status, age and request ID; distinguish cached content from origin recovery.
```bash
curl -I https://REPLACE_DISTRIBUTION/ | tee evidence/cloudfront-headers.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Complete `FAILOVER-REPORT.md` with observed TTL, health transition, client transition and limitation.
```bash
open FAILOVER-REPORT.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Capture DNS health and CloudFront evidence as JPEGs; run validation and restore the baseline.
```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

Health and record evidence are linked, failover timing is measured rather than assumed, cache and DNS effects are distinguished, baseline is restored, and validation emits LAB 10 PASS.


#### Evidence to retain

- Health check
- record change
- DNS before/failover results
- CloudFront headers
- completed failover report
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- Uses learner-owned hosted zone
- Primary and secondary identifiers are explicit
- TTL is measured
- Cache response is distinguished from origin
- Rollback restores baseline


### Lab 11 — Diagnose Storage and Database Performance, Then Recover

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 3 · Topic 09 |
| Objective | Apply K1, K4, A1, A4 and A6 by correlating EBS/RDS signals, selecting a safe change and validating data recovery. |
| Scenario | A transactional workload shows rising latency after a change, and the operator must determine whether compute, storage, connections or query behaviour is the bottleneck. |
| Deliverable | A metric analysis, bottleneck decision, change plan, restore checklist and database recovery evidence. |
| Services | CloudWatch · EBS · RDS · Performance Insights · AWS Backup |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Open `data/metrics.csv`; define units, timestamps and expected baseline before calculating any conclusion.
```bash
column -s, -t data/metrics.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Run `analyse_metrics.py`; inspect the output ranking and confirm the highest deviation is reproducible.
```bash
python3 analyse_metrics.py | tee evidence/metric-analysis.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Compare CPU, EBS queue, IOPS, throughput, connections and latency in `BOTTLENECK-DECISION.md`.
```bash
open BOTTLENECK-DECISION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Inspect the learner RDS configuration and CloudWatch metrics for the same interval where available.
```bash
aws rds describe-db-instances --db-instance-identifier REPLACE_DB --output json | tee evidence/rds-config.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Review Performance Insights or database-engine evidence for waits, slow statements or locks; record limitations if unavailable.
```bash
open QUERY-EVIDENCE.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Propose one reversible action with risk, owner, expected signal and rollback; do not change multiple variables.
```bash
open CHANGE-PLAN.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Create a snapshot or approved recovery point and record its timestamp and status.
```bash
aws rds create-db-snapshot --db-instance-identifier REPLACE_DB --db-snapshot-identifier sysops-lab11-REPLACE_SUFFIX | tee evidence/snapshot.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Restore to an isolated learner identifier and verify engine status and a trainer-provided data check.
```bash
aws rds restore-db-instance-from-db-snapshot --db-instance-identifier sysops-lab11-restore-REPLACE_SUFFIX --db-snapshot-identifier sysops-lab11-REPLACE_SUFFIX | tee evidence/restore.json
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Capture metrics, snapshot and restore evidence as JPEGs; record actual recovery timing.
```bash
open EXPECTED-ARCHITECTURE.jpg
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Run validation; delete the isolated restore and learner snapshot when approved.
```bash
bash validate.sh
bash cleanup.sh | tee evidence/cleanup.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

Metric calculations are reproducible, the chosen bottleneck cites evidence, one reversible action is proposed, recovery is isolated and timed, and validation emits LAB 11 PASS.


#### Evidence to retain

- Metric analysis
- RDS configuration
- query evidence
- snapshot/restore records
- completed bottleneck and change decisions
- JPEG evidence
- cleanup.txt


#### Acceptance criteria

- Units and baseline stated
- Cause remains a hypothesis until tested
- One variable changed
- Restore does not overwrite source
- Data validation and actual timing recorded


### Lab 12 — Capstone — Resolve a Multi-Service CloudOps Incident

| Field | Lab specification |
| --- | --- |
| Day / topic | Day 3 · Topic 10 |
| Objective | Apply A1–A7 in one connected incident by detecting impact, isolating the failed boundary, restoring service, validating data and documenting service-quality improvements. |
| Scenario | After a routine change, Northstar Retail experiences elevated web latency, intermittent 5xx responses, rejected VPC traffic, an incomplete backup job and a security finding. |
| Deliverable | A timeline, evidence matrix, prioritised hypotheses, recovery runbook, validation record and post-incident action register. |
| Services | CloudWatch · CloudTrail · VPC Flow Logs · ELB · AWS Backup · Security Hub · Systems Manager |
| Visual | EXPECTED-ARCHITECTURE.jpg |


#### Before you begin

- Confirm caller identity and Region.
- Read every supplied editable YAML, JSON, shell, Python or CLI asset.
- Resolve every REPLACE placeholder and use a unique learner suffix.
- Define expected service, security, performance and cleanup evidence before changing AWS.


#### Step-by-step procedure

1. Read every file in `data/`; record evidence source, timestamp, timezone and reliability in `EVIDENCE-MATRIX.csv`.
```bash
for f in data/*; do echo "--- $f"; sed -n '1,80p' "$f"; done
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

2. Run `build_timeline.py`; verify the merged timeline is chronologically sorted and retains source IDs.
```bash
python3 build_timeline.py | tee evidence/timeline-build.txt
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

3. Frame impact, scope and declared severity without naming a root cause yet.
```bash
open INCIDENT-RECORD.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

4. Rank at least three hypotheses and name one discriminating test for each.
```bash
open HYPOTHESES.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

5. Identify the first failed boundary by correlating ALB health, Flow Logs, change events and application latency.
```bash
open output/timeline.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

6. Review backup and security evidence; decide which items block recovery and which become follow-up actions.
```bash
open EVIDENCE-MATRIX.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

7. Complete `RECOVERY-RUNBOOK.md` with authority, exact action, safety check, verification, communication and rollback.
```bash
open RECOVERY-RUNBOOK.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

8. Execute the trainer-approved simulation action or tabletop step; record UTC timestamps and observed outputs.
```bash
open RECOVERY-VALIDATION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

9. Validate service health, request success, data integrity, security control and recovery objective.
```bash
open RECOVERY-VALIDATION.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

10. Complete `ACTIONS.csv` with preventive, detective and recovery controls, owner, due date and verification threshold.
```bash
open ACTIONS.csv
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

11. Deliver a five-minute operational briefing: impact, evidence, decision, recovery, limitation and next controls.
```bash
open INCIDENT-RECORD.md
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.

12. Capture the final dashboard/architecture evidence as JPEG and run the capstone validator.
```bash
open EXPECTED-ARCHITECTURE.jpg
bash validate.sh
```

Evidence checkpoint: record the observed state, timestamp and resource identifier before continuing.


#### Verification

All evidence IDs reconcile, the timeline precedes causal claims, recovery and rollback are explicit, validation covers service and data, A1–A7 are mapped, and validation emits LAB 12 PASS.


#### Evidence to retain

- timeline.csv
- evidence matrix
- hypothesis register
- incident record
- recovery runbook
- recovery validation
- ACTIONS.csv
- five-minute briefing
- JPEG evidence


#### Acceptance criteria

- A1–A7 traceability complete
- Observation and hypothesis separated
- First failed boundary supported
- Recovery includes rollback and communication
- Every action has owner, due date and measurable verification


## Assessment Readiness

| Instrument | Count | Duration | Coverage | Practice evidence |
| --- | --- | --- | --- | --- |
| WA-SAQ | 5 open-ended questions | 60 min | K1–K5 | Concept explanations across Topics 01–10 |
| Case Study | 5 connected tasks | 60 min | A1–A7 | Labs 01–12, especially integrated Lab 12 |

| Criterion | Assessment focus | Taught in | Practised in |
| --- | --- | --- | --- |
| K1 | Cloud infrastructure components and technology | Topics 01, 04, 08, 09 | Labs 04, 09–11 |
| K2 | Infrastructure configuration and troubleshooting | Topics 02, 08, 10 | Labs 01–02, 09–10, 12 |
| K3 | Supporting package and fleet operations | Topics 03, 06 | Labs 03, 05 |
| K4 | Application design, maintenance and troubleshooting | Topics 04–10 | Labs 04–12 |
| K5 | Virtualisation technologies | Topics 01, 03, 04 | Labs 03–04 |
| A3, A5 | Availability and controlled release | Topics 04, 06 | Labs 04–05 |
| A1 | Monitoring, backup and recovery | Topics 02, 05, 09 | Labs 01–02, 06, 11 |
| A7 | Service quality and compliance | Topic 07 | Lab 07 |
| A4, A6 | Issue analysis, continuity and recovery | Topics 05, 10 | Labs 06, 12 |
| A2 | Diagnostics at scale | Topics 08, 10 | Labs 09–10, 12 |

> **Operational note:** Use your own words and justify each recommendation with observed evidence, risk, verification and rollback. The WSQ assessment is separate from the AWS certification examination.


## Glossary

| Term | Meaning |
| --- | --- |
| Alarm | A stateful evaluation of a metric or expression against defined criteria. |
| Blast radius | The maximum scope of impact from a failure or change. |
| CloudOps | Disciplined operation of cloud workloads using observable, automated and governed practices. |
| Drift | Difference between declared desired configuration and actual resource state. |
| RPO | Maximum acceptable data loss measured in time. |
| RTO | Maximum acceptable time to restore service. |
| Runbook | Controlled operational procedure with inputs, authority, verification and recovery. |
| SLI / SLO | Measured service indicator and the target set for it. |
| Telemetry | Metrics, logs, traces, events and configuration evidence used to understand a system. |
