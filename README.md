# AWS QE Architecture - Quality Engineering for AWS Cloud

> Production-grade Quality Engineering frameworks, reference implementations, and playbooks for modern AWS workloads.

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-%235C4EE5.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-%23326CE5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)

## 🎯 Purpose

This repository serves as a **comprehensive blueprint** for implementing modern Quality Engineering practices on AWS. It demonstrates how to shift quality left, embed resilience, and deliver high-confidence production systems using AWS-native services.

**Flagship companion to [`gcp-qe-architecture`](https://github.com/anandkrshnn-ai/gcp-qe-architecture)** — showcasing true multi-cloud QE expertise.

## 📁 Repository Structure

- **`docs/`** — Strategic frameworks and playbooks
- **`guides/`** — Service-specific quality guides
- **`reference-implementations/`** — Production-ready code and configurations
- **`templates/`** — Reusable documents and checklists
- **`tools/`** — Automation and analysis scripts

## ✨ What's Inside

### Advanced Strategy & Playbooks
- Quality Strategy for AWS Modernization
- Performance Engineering Framework (Shift-Left on AWS)
- Chaos Engineering with AWS FIS
- AWS Well-Architected Framework + Quality Lens

### Reference Implementations
- **Terraform AWS Baseline** – Secure multi-account foundation with built-in observability
- **Chaos Experiments** – FIS templates for EC2, RDS, EKS, and Network
- **k6 Performance Tests** – Integrated with CodePipeline
- **CloudWatch + Synthetics** – SLO monitoring modules

### Service Guides
- EKS Testing Guide (Multi-cluster, Service Mesh, Observability)
- Lambda/Serverless Quality Framework
- RDS/Aurora Resilience & Failover Testing
- API Gateway + EventBridge quality patterns

### Templates & Tools
- Test Strategy Template (AWS)
- Production Readiness Review Checklist
- Defect Escape Analyzer (Python)

## 🚀 Quick Start

```bash
git clone https://github.com/anandkrshnn-ai/aws-qe-architecture.git
cd aws-qe-architecture
```

Explore:
- [Quality Strategy for AWS Modernization](docs/01-quality-strategy-for-aws-modernization.md)
- [EKS Testing Guide](guides/eks-testing-guide.md)
- [Terraform Baseline](reference-implementations/terraform-aws-baseline/)

## 🔗 Related Repositories
- [gcp-qe-architecture](https://github.com/anandkrshnn-ai/gcp-qe-architecture) — GCP counterpart

---

**Made with ❤️ by Anandakrishnan**  
*Quality Engineering Architect | Multi-Cloud | AI-Augmented QE*
