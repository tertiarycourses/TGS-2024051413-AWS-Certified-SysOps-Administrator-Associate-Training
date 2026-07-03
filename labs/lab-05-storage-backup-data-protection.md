# Lab 05 - Storage, Backup, and Data Protection

## Objectives

- Configure safe S3 storage settings.
- Understand versioning, encryption, and lifecycle rules.
- Review EBS snapshots and file storage options.
- Use AWS Backup concepts for policy-based protection.

## Scenario

Your team must protect application data against accidental deletion, corruption, and operational mistakes. You will compare storage services and backup methods.

## Steps

1. Open Amazon S3.
2. Create a training bucket only if permitted.
3. Keep Block Public Access enabled.
4. Enable bucket versioning.
5. Enable default server-side encryption.
6. Upload a small text file.
7. Modify and upload the same file again.
8. Review object versions.
9. Create a lifecycle rule for noncurrent versions.
10. Open EC2 Volumes.
11. Review EBS volume types and encryption.
12. Create an EBS snapshot only in a trainer-approved environment.
13. Review snapshot permissions and sharing settings.
14. Open Amazon EFS and review file system use cases.
15. Compare S3, EBS, and EFS using access pattern, durability, and cost.
16. Open AWS Backup.
17. Review backup vaults, backup plans, and protected resources.
18. Draft a backup policy for a sample workload.

## Validation

- You can explain why S3 public access should usually remain blocked.
- You can restore or identify an earlier object version.
- You can describe snapshot use cases.
- You can choose between service-native backup and AWS Backup.

## Cleanup

Delete sample S3 objects, snapshots, and backup resources created in the lab.

## Review Questions

1. What problem does S3 versioning solve?
2. Why is encryption important for backup data?
3. How is an EBS snapshot different from an AMI?
4. When would AWS Backup be preferred over manual snapshots?
