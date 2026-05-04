# AWS Chaos Engineering Playbook

Chaos engineering on AWS leverages the **AWS Fault Injection Simulator (FIS)** to inject controlled failures and build confidence in system resilience.

## 1. Prerequisites
-   **Observability:** CloudWatch Dashboards and Alarms must be active.
-   **FIS Role:** IAM role with permissions to inject faults into targeted resources.
-   **Stop Conditions:** Define CloudWatch Alarms that automatically stop experiments if SLOs are breached.

## 2. Common AWS Chaos Experiments
| Experiment | Target | Failure Mode | Success Metric |
| :--- | :--- | :--- | :--- |
| **EC2 Termination** | Auto Scaling Group | Terminate random instances. | ASG replaces instances; zero downtime. |
| **RDS Failover** | Aurora / RDS HA | Trigger manual failover to replica. | Client reconnects within 30s. |
| **Network Latency** | Subnet / Instance | Inject 1000ms latency via FIS. | App handles timeouts gracefully. |
| **S3 Access Denied** | IAM / Bucket Policy | Simulate permission changes. | App displays friendly error / uses fallback. |
| **Lambda Concurrency** | Lambda Service | Throttle execution. | DLQ capture or retry logic kicks in. |

## 3. Experiment Lifecycle with FIS
1.  **Steady State:** Latency < 50ms, 2xx > 99.9%.
2.  **Hypothesis:** "If an RDS failover occurs, the application will reconnect to the new primary within 30 seconds."
3.  **FIS Action:** `aws:rds:failover-db-cluster`.
4.  **Observe:** Monitor CloudWatch metrics.
5.  **Fix:** Implement better connection pooling if failure duration exceeded 30s.

## 4. Tools
-   **AWS FIS:** Managed service for fault injection.
-   **Chaos Toolkit AWS Add-on:** For cross-cloud automation.
-   **LitmusChaos:** For EKS-specific resilience testing.

---

*See the [AWS FIS Experiments](../reference-implementations/chaos-fis/) for template definitions.*
