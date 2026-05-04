# Test Strategy Template - AWS Modernization

## 1. Program Overview
*   **Project Name:** [e.g., AWS Migration Phase 1]
*   **Goal:** [e.g., Replatforming Core API to EKS]
*   **Success Metrics:** [e.g., < 0.5% defect escape rate]

## 2. AWS-Specific Test Levels
| Level | Type | Tooling | Responsibility |
| :--- | :--- | :--- | :--- |
| **IaC** | Static Analysis | Checkov / TFLint | DevOps / Dev |
| **Unit** | Code Logic | PyTest / Jest | Developers |
| **Integration** | Service Integration | LocalStack / SAM | QE / Dev |
| **Performance** | Load/Stress | k6 / Artillery | Performance Eng |
| **Resilience** | Chaos | AWS FIS | SRE / QE |
| **Security** | DAST/SCA | Inspector / Snyk | SecOps |

## 3. Deployment Environments
-   **Sandbox:** Individual developer accounts.
-   **Dev/QA:** Shared environment for integration.
-   **Stage:** Production mirror for load and chaos testing.
-   **Prod:** Production with canary releases.

## 4. Automated Quality Gates
-   [ ] **Static:** Checkov scan passes with zero "High" violations.
-   [ ] **Functional:** 100% of critical path tests pass in CodeBuild.
-   [ ] **Performance:** P95 latency within 500ms in Stage.
-   [ ] **Observability:** Synthetic canaries active and healthy.

## 5. Defect Management
-   **Tracking:** Jira / AWS DevOps Issues.
-   **SLA:** Critical bugs resolved within 4 hours (P0).

---
*Approver:* ____________________ (QE Architect)
