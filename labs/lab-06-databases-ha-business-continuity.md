# Lab 06 - Databases, High Availability, and Business Continuity

## Objectives

- Review managed database availability options.
- Compare backups, snapshots, replicas, and Multi-AZ.
- Define RTO and RPO.
- Select continuity patterns for example workloads.

## Scenario

A business application needs a recovery plan. You must recommend availability and backup options without overengineering the solution.

## Steps

1. Open Amazon RDS.
2. Review available database engines.
3. Inspect backup retention settings for a sample configuration.
4. Compare automated backups and manual snapshots.
5. Review Multi-AZ deployment behavior.
6. Review read replica use cases.
7. Discuss when a read replica is not a failover solution by itself.
8. Review Aurora availability and storage concepts.
9. Open DynamoDB.
10. Review table backup settings if a table exists.
11. Review point-in-time recovery.
12. Compare single-Region and multi-Region continuity options.
13. Define RTO and RPO for three sample workloads:
    - Internal reporting system.
    - Public course registration system.
    - Payment processing support database.
14. Map each workload to a backup and recovery option.
15. Identify operational checks needed after a restore.

## Validation

- You can explain RTO and RPO.
- You can compare Multi-AZ and read replicas.
- You can identify when point-in-time recovery is useful.
- You can recommend a continuity pattern based on business impact.

## Cleanup

Delete any sample databases, snapshots, or tables created for the lab.

## Review Questions

1. Why is Multi-AZ different from a read replica?
2. What does point-in-time recovery protect against?
3. Why should restore procedures be tested?
4. How does business criticality affect backup design?
