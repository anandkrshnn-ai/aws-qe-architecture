# RDS / Aurora Resilience Guide

Ensuring database availability and performance on AWS through rigorous resilience engineering.

## 1. High Availability (HA) Validation
-   **Multi-AZ Failover:** Trigger and measure the duration of a failover from primary to standby.
-   **Aurora Serverless v2 Scaling:** Validate that the database scales compute resources in response to load without dropping connections.

## 2. Disaster Recovery Gates
-   **Global Database Failover:** (If applicable) Test the failover of an Aurora Global Database to a secondary region.
-   **Snapshot Integrity:** Weekly automated restoration of RDS snapshots to verify RPO/RTO.
-   **Backtrack:** (Aurora MySQL) Validate the ability to "rewind" the database to a specific point in time.

## 3. Performance Insights & Observability
-   **Enhanced Monitoring:** Ensure 1-second granularity is enabled during performance testing.
-   **Performance Insights:** Analyze top SQL queries contributing to `DBLoad`.
-   **CloudWatch Logs:** Export slow query logs for automated analysis.

## 4. Connection Resilience
-   **RDS Proxy:** Use RDS Proxy to handle connection spikes and reduce failover time by up to 60%.
-   **App-side Retries:** Verify that application-side database drivers implement retry logic with jitter.

---

*See [AWS FIS Experiments](../reference-implementations/chaos-fis/) for the RDS failover template.*
