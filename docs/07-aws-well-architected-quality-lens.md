# AWS Well-Architected Framework: The Quality Lens

This document maps the core AWS Well-Architected pillars to modern Quality Engineering practices.

## 1. Reliability Pillar (The Resilience Gate)
-   **QE Requirement:** Every service must pass a Zone Failure experiment before going live.
-   **AWS Service:** Multi-AZ deployments, Route 53 Health Checks.
-   **Validation:** Use AWS FIS to simulate zone-level outages.

## 2. Performance Efficiency Pillar (The Scalability Gate)
-   **QE Requirement:** Autoscaling must be validated against 2x peak load.
-   **AWS Service:** Auto Scaling, Karpenter, Aurora Serverless.
-   **Validation:** Integrate Artillery load tests into CodePipeline.

## 3. Operational Excellence Pillar (The Observability Gate)
-   **QE Requirement:** 100% of services must have SLOs and Synthetic Canaries.
-   **AWS Service:** CloudWatch Synthetics, X-Ray.
-   **Validation:** Verify dashboard presence in the PRR checklist.

## 4. Security Pillar (The Compliance Gate)
-   **QE Requirement:** Zero high-severity vulnerabilities in IAM and Container scans.
-   **AWS Service:** IAM Access Analyzer, Amazon Inspector.
-   **Validation:** Automated scanning in CodeBuild.

## 5. Cost Optimization Pillar (The Efficiency Gate)
-   **QE Requirement:** Performance/Cost ratio must be within 10% of the baseline.
-   **AWS Service:** Compute Optimizer, Cost Explorer.
-   **Validation:** Use the [Cost + Quality Optimizer](../tools/cost-quality-optimizer/) script.

---

*Use the [Prod Readiness Review](../templates/prod-readiness-review.md) to audit these pillars.*
