# Lambda / Serverless Quality Framework

Serverless architectures on AWS require specialized testing patterns due to cold starts, event-driven triggers, and execution limits.

## 1. Local Testing & Emulation
-   **AWS SAM / CDK Local:** Use `sam local invoke` to test functions with mock events.
-   **LocalStack:** Emulate AWS services (S3, SQS, DynamoDB) locally for integration testing.

## 2. Performance & Latency Gates
-   **Cold Start Monitoring:** Track `InitDuration` in CloudWatch Logs. Use Provisioned Concurrency for critical paths.
-   **Memory Tuning:** Use **AWS Lambda Power Tuning** to find the optimal memory/cost ratio.
-   **Concurrency Limits:** Validate that functions don't hit account-level concurrency limits during peak load.

## 3. Resilience & Error Handling
-   **DLQ / On-Failure Destinations:** Verify that failed events are captured in Dead Letter Queues (SQS) or SNS.
-   **Retry Logic:** Test exponential backoff behavior for asynchronous invocations.
-   **Idempotency:** Ensure functions handle duplicate events correctly (use Lambda Powertools Idempotency).

## 4. Automated Quality Gates
-   **Tag-based Testing:** Deploy a new version, run tests against the version-specific ARN, then update the alias (e.g., `PROD`).
-   **Canary Deployments:** Use **AWS CodeDeploy** to shift traffic gradually (e.g., `LambdaLinear10PercentEvery1Minute`).

---

*See [Performance Engineering on AWS](../docs/05-performance-engineering-aws.md) for tuning strategies.*
