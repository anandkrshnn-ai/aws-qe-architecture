# AWS EKS Cluster with Quality Guards
# This module sets up a production-ready EKS cluster with integrated monitoring and chaos tagging.

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  cluster_endpoint_public_access = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.control_plane_subnet_ids

  eks_managed_node_groups = {
    green = {
      min_size     = 3
      max_size     = 10
      desired_size = 3

      instance_types = ["t3.large"]
      capacity_type  = "SPOT" # Cost-optimization with SPOT instances

      labels = {
        Environment = "production"
        QualityTier = "High"
      }

      # Tagging for Chaos Experiments (AWS FIS)
      tags = {
        "chaos:inject" = "true"
      }
    }
  }

  # Cluster logging for observability
  cluster_enabled_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}
