# EKS Testing Guide - Multi-Layered Quality Approach

## Overview

Comprehensive quality strategy for Amazon Elastic Kubernetes Service (EKS) workloads.

## Testing Layers

### 1. Infrastructure Layer
- Terraform/OpenTofu validation + `terraform validate` + `tflint`
- OPA/Gatekeeper policies
- Cluster configuration drift detection

### 2. Cluster & Platform Layer
- EKS add-ons health checks
- Karpenter / Cluster Autoscaler behavior testing
- Service Mesh (Istio / AWS App Mesh) traffic shifting validation

### 3. Application Layer
- Unit + Integration + Contract testing
- k6 + Artillery load tests inside the cluster
- Chaos Mesh + AWS FIS integration

### 4. Observability & SLO Layer
- Golden Signals monitoring
- CloudWatch Container Insights + Managed Prometheus
- Synthetic canaries + CloudWatch Synthetics

## Reference Chaos Experiments
- Pod kill, network latency, CPU stress, RDS failover during load

## Recommended Tools
- **Testing**: k6, pytest, Terratest, Helm test
- **Chaos**: AWS FIS, Chaos Mesh, Litmus
- **Policy**: Kyverno, OPA Gatekeeper
- **Security**: Trivy, Falco, Prisma Cloud

**See reference implementations** → `reference-implementations/chaos-fis/`
