# Performance Engineering Framework for AWS

Modern cloud applications on AWS require performance to be engineered into the architecture using AWS-native tools and the Cloud Development Kit (CDK).

## 1. The Performance Engineering Lifecycle
1.  **Define NFRs:** Use the [NFR Spec Template](../templates/nfr-spec-template.md) to define latency (P95/P99), throughput (TPS), and concurrency.
2.  **Establish Baselines:** Use **AWS X-Ray** to identify baseline latencies for Lambda and ECS/EKS services.
3.  **Continuous Validation:** Integrate **Artillery** or **k6** tests into **AWS CodeBuild**.
4.  **Analyze & Tune:** Use **CloudWatch Lambda Insights** and **Compute Optimizer** to right-size resources.

## 2. Load Testing Strategy
-   **Serverless Load Tests:** Test Lambda concurrency limits and cold start impact.
-   **EKS Scaling Tests:** Verify Karpenter node provisioning speed.
-   **RDS Stress Tests:** Validate performance under high connection churn and read-heavy workloads.
-   **End-to-End Stress Tests:** Use **AWS Load Testing** service for managed large-scale simulations.

## 3. AWS Performance Tuning Checklist
-   **Lambda:** Memory allocation vs CPU speed, Provisioned Concurrency.
-   **EKS:** Cluster Autoscaler / Karpenter configuration, Pod resource limits.
-   **RDS:** Aurora Serverless v2 scaling parameters, read replicas, and Performance Insights.
-   **CloudFront:** Cache hit ratio optimization and Lambda@Edge/CloudFront Functions performance.

## 4. Pass/Fail Criteria (Quality Gates)
-   `P95 Latency < target_ms`
-   `Cold Start Duration < 500ms` for critical paths.
-   `Error Rate < 0.01%` during ramp-up.

---

*See the [k6 Performance Tests](../reference-implementations/k6-aws/) for executable examples.*
