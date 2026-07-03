# Lab 03 - EC2, Systems Manager, Patching, and Automation

## Objectives

- Review EC2 operational settings.
- Use Systems Manager to manage instances.
- Run commands without opening SSH to the internet.
- Review patch and automation concepts.

## Scenario

Your team manages compute workloads on EC2. You need a secure way to connect, inspect, patch, and automate common maintenance tasks.

## Steps

1. Open the EC2 console.
2. Review AMIs, instance types, key pairs, and security groups.
3. Launch a small test instance only if your trainer permits it.
4. Apply the course tags to the instance.
5. Confirm the instance has an IAM instance profile that allows Systems Manager.
6. Open Systems Manager.
7. Go to Fleet Manager or Managed Nodes.
8. Confirm the instance appears as a managed node.
9. Start a Session Manager session.
10. Run safe inspection commands, for example:

    ```bash
    hostname
    uptime
    whoami
    ```

11. Open Run Command.
12. Run a safe command such as `AWS-RunShellScript` with `hostname`.
13. Review command output and command status.
14. Open Inventory and review collected metadata.
15. Open Patch Manager and inspect patch baselines.
16. Open Automation and review AWS managed runbooks.
17. Identify one operational task that should be automated.

## Validation

- You can connect through Systems Manager.
- You can run a command and review output.
- You can explain the role of Patch Manager.
- You can identify when Automation runbooks are useful.

## Cleanup

Terminate test instances and delete unused volumes if the lab created them.

## Review Questions

1. Why is Session Manager safer than opening SSH to the internet?
2. What permissions are required for an instance to be managed by Systems Manager?
3. What is the difference between Run Command and Automation?
4. Why should patching use controlled maintenance windows?
